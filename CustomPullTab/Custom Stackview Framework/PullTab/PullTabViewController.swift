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
    func viewCollapsed(view: UIView)
    func viewExpanded(view: UIView)
    func previousViewMinimized(view: UIView)
}

public class PullTabViewController: UIViewController {
    
    weak var viewStatusDelegate: PullTabViewControllerStatusDelegate?
    
    //Public properties to customise UI
    public var topViewStartPoint: CGFloat {
        return view.frame.height * 3 / 4
    }
    public var customViewHeightBuffer: CGFloat = 0
    
    private var customViews: [BaseCustomView] = []
    private var customViewTopYPoint: CGFloat = 0
    private var currentVisibleViewIndex = -1
    
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
            let currentViewNew = customViews[currentVisibleViewIndex]
            viewStatusDelegate?.viewCollapsed(view: currentViewNew)
            handleExpandView(index: currentVisibleViewIndex - 1)
            UIView.animate(withDuration: 0.3, delay: 0.0, options:[], animations: {
                let diff = (Constants.verticalViewPadding * CGFloat(self.customViews.count - currentViewNew.tag))
                currentViewNew.frame.origin.y = self.view.frame.height - diff
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            // Any view with next view
            let viewToHide = customViews[currentVisibleViewIndex + 1]
            let viewToCollapse = customViews[currentVisibleViewIndex]
            viewStatusDelegate?.viewCollapsed(view: viewToCollapse)
            handleExpandView(index: currentVisibleViewIndex - 1)
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
    
    func handleExpandView(index: Int) {
        if index <= customViews.count - 1 && index >= 0 {
            viewStatusDelegate?.viewExpanded(view: customViews[index])
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
        if currentVisibleViewIndex > 0 && currentVisibleViewIndex < customViews.count {
            viewStatusDelegate?.previousViewMinimized(view: customViews[currentVisibleViewIndex - 1])
        }
        
        handleExpandView(index: currentVisibleViewIndex)
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
