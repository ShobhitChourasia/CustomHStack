//
//  ViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 13/06/21.
//

import UIKit

protocol CustomViewStateInput {
    
    func toggleToCollapsedView()
    func toggleToExpandedView()
    
}

class ViewController: PullTabViewController, PullTabViewControllerStackDelegate {

    private let viewControllerOne: AmountSelectionViewController
    private let viewControllerTwo: DurationSelectionViewController
    private let viewControllerTHree: PaymentModeSelectionViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewControllerOne.delegate = self
        viewControllerTwo.delegate = self
        
        viewStatusDelegate = self
    }


    init(viewControllerOne: AmountSelectionViewController, viewControllerTwo: DurationSelectionViewController,
         viewControllerThree: PaymentModeSelectionViewController) {
        
        self.viewControllerOne = viewControllerOne
        self.viewControllerTwo = viewControllerTwo
        self.viewControllerTHree = viewControllerThree
        
        super.init(customViews: [viewControllerOne.customView, viewControllerTwo.customView, viewControllerThree.customView])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToNextView() {
        handleTapGesture()
    }
    
}

// MARK: - PullTabViewControllerStatusDelegate

private typealias DelegateHandler = ViewController
extension DelegateHandler: PullTabViewControllerStatusDelegate {
    
    func viewExpanded(view: UIView) {
        switch view {
        case is AmountSelectionView:
            viewControllerOne.toggleToExpandedView()
        case is DurationSelectionView:
            viewControllerTwo.toggleToExpandedView()
        case is PaymentModeSelectionView:
            ()
        default: break
        }
    }
    
    func viewCollapsed() {
        
    }
    
}
