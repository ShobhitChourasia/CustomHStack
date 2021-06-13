//
//  BaseViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 13/06/21.
//

import UIKit

class BaseViewController: UIViewController {

    private var customViews: [BaseCustomView] = []
    private var customViewTopYPoint: CGFloat = 0
    private var customViewsCount: Int {
        return customViews.count
    }
    private var currentVisibleViewIndex = 0
    
    public var customViewHeightBuffer: CGFloat = 50
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard !customViews.isEmpty else { return }
        setupViews()
    }
}

private typealias ViewSetup = BaseViewController
private extension ViewSetup {
    
    func setupViews() {
        pullViewAtIndex(index: currentVisibleViewIndex)
        customViews.forEach {
            $0.delegate = self
        }
    }
    
    func pullViewAtIndex(index: Int) {
        let customView = customViews[index]
        customViewTopYPoint = view.frame.height - customViewHeightBuffer
        customView.frame = CGRect(x: 0, y: customViewTopYPoint, width: view.frame.width, height: 50)
        view.addSubview(customView)
    }
    
}

private typealias ViewTapGestureHandler = BaseViewController
extension ViewTapGestureHandler: CustomViewDelegate {
    
    func handleTapGesture() {
        print(customViews[currentVisibleViewIndex])
    }
}
