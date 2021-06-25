//
//  PullTabViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 13/06/21.
//

import UIKit

protocol PullTabViewControllerStackDelegate: AnyObject {
    
    func expandView()
    func collapseView()
    
}

protocol PullTabViewControllerStatusDelegate: AnyObject {
    
    func viewCollapsed()
    func viewExpanded(view: UIView)
    
}

public class PullTabViewController: UIViewController {
    
    weak var viewStatusDelegate: PullTabViewControllerStatusDelegate?
    
    private var customViews: [BaseCustomView] = []
    private var customViewTopYPoint: CGFloat = 0
    private var topViewStartPoint: CGFloat {
        return view.frame.height * 3 / 4
    }
    
    private var currentVisibleViewIndex = -1
    
    public var customViewHeightBuffer: CGFloat = 0
    
    convenience init() {
        self.init(customViews: [])
    }
    
    init(customViews: [BaseCustomView]) {
        self.customViews = customViews
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        guard !customViews.isEmpty else { return }
        setupViews()
    }
}

//MARK: - Methods to handle moving view up and down

private typealias ViewMovement = PullTabViewController
extension PullTabViewController {
    
    func pullViewUp() {
        
        currentVisibleViewIndex += 1
        customViewHeightBuffer += Constants.verticalViewPadding
        
        guard currentVisibleViewIndex < customViews.count else { return }
        let currentCustomView = customViews[currentVisibleViewIndex]
        let height = topViewStartPoint - (Constants.verticalViewPadding * CGFloat(currentCustomView.tag))
        customViewTopYPoint = view.frame.height - Constants.verticalViewPadding
        currentCustomView.frame = CGRect(x: 0, y: customViewTopYPoint, width: view.frame.width, height: height)
        
        if !view.subviews.contains(currentCustomView) {
            view.addSubview(currentCustomView)
        }
    }
    
    func pullViewDown() {
        currentVisibleViewIndex -= 1
        customViewHeightBuffer -= Constants.verticalViewPadding
        
        // If last view
        if currentVisibleViewIndex == customViews.count - 1 {
            //        guard !(currentVisibleViewIndex < 0) else { return }
            let currentViewNew = customViews[currentVisibleViewIndex]
            UIView.animate(withDuration: 0.3, delay: 0.0, options:[], animations: {
                let diff = (Constants.verticalViewPadding * CGFloat(self.customViews.count - currentViewNew.tag))
                currentViewNew.frame.origin.y = self.view.frame.height - diff
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            // Any view with next view
            let viewToHide = customViews[currentVisibleViewIndex + 1]
            let viewToCollapse = customViews[currentVisibleViewIndex]
            UIView.animate(withDuration: 0.3, delay: 0.0, options:[], animations: {
                viewToHide.frame.origin.y = self.view.frame.height
                viewToCollapse.frame.origin.y = self.view.frame.height - Constants.verticalViewPadding
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}

private typealias ViewSetup = PullTabViewController
private extension ViewSetup {
    
    func setupViews() {
        pullViewUp()
        for (index, element) in customViews.enumerated() {
            element.delegate = self
            element.tag = index
        }
    }
    
}

private typealias ViewTapGestureHandler = PullTabViewController
extension ViewTapGestureHandler: CustomViewDelegate {
    
    func handleTapGesture() {
        guard currentVisibleViewIndex < customViews.count else { return }
        let currentView = customViews[currentVisibleViewIndex]
        let viewHeight = view.frame.height - topViewStartPoint + customViewHeightBuffer + Constants.bottomViewPadding
        UIView.animate(withDuration: 0.3, delay: 0.0, options:[], animations: {
            currentView.frame.origin.y = viewHeight
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        viewStatusDelegate?.viewExpanded(view: currentView)
        
        pullViewUp()
    }
}

private typealias Constant = PullTabViewController
private extension Constant {
    
    enum Constants {
        static let verticalViewPadding: CGFloat = 80
        static let bottomViewPadding: CGFloat = 12
    }
    
}
