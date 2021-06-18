//
//  PullTabViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 13/06/21.
//

import UIKit

protocol PullTabViewControllerStackDelegate: AnyObject {

    func moveToNextView()

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
        return view.frame.height * 2 / 3
    }
    
    private var customViewsCount: Int {
        return customViews.count
    }
    private var currentVisibleViewIndex = 0
    
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
        guard currentVisibleViewIndex < customViews.count else { return }
        let currentCustomView = customViews[currentVisibleViewIndex]
        
        let diff = currentVisibleViewIndex == customViews.count - 1 ? 1 : currentVisibleViewIndex
        let height = topViewStartPoint - (Constants.verticalViewPadding * CGFloat(diff))

        customViewTopYPoint = view.frame.height - Constants.verticalViewPadding
        currentCustomView.frame = CGRect(x: 0, y: customViewTopYPoint, width: view.frame.width, height: height)
        
        view.addSubview(currentCustomView)
    }
    
    func pullViewDown() {
        //        UIView.animate(withDuration: 0.5, delay: 0.0, options:[], animations: {
        //                let screenSize = UIScreen.main.bounds.size
        //            currentView.transform = CGAffineTransform(translationX: 0, y: screenSize.height * 0.5)
        //            }, completion: nil)
    }
    
}

private typealias ViewSetup = PullTabViewController
private extension ViewSetup {
    
    func setupViews() {
        pullViewUp()
        customViews.forEach {
            $0.delegate = self
        }
    }
    
}

private typealias ViewTapGestureHandler = PullTabViewController
extension ViewTapGestureHandler: CustomViewDelegate {
    
    func handleTapGesture() {
        guard currentVisibleViewIndex < customViews.count else { return }
        let currentView = customViews[currentVisibleViewIndex]
        let screenSize = -topViewStartPoint + customViewHeightBuffer + Constants.bottomViewPadding
        UIView.animate(withDuration: 0.3, delay: 0.0, options:[], animations: {
            currentView.transform = CGAffineTransform(translationX: 0, y: screenSize)
            }, completion: nil)
        
        viewStatusDelegate?.viewExpanded(view: currentView)
        
        currentVisibleViewIndex += 1
        customViewHeightBuffer += Constants.verticalViewPadding
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
