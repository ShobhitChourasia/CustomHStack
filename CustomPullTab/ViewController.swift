//
//  ViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 13/06/21.
//

import UIKit

class ViewController: PullTabViewController, PullTabViewControllerStackDelegate {

    private let viewControllerOne: AmountSelectionViewController
    private let viewControllerTwo: DurationSelectionViewController
    private let viewControllerTHree: PaymentModeSelectionViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewControllerOne.delegate = self
        viewControllerTwo.delegate = self
    }


    init(viewControllerOne: AmountSelectionViewController, viewControllerTwo: DurationSelectionViewController,
         viewControllerThree: PaymentModeSelectionViewController) {
        
        self.viewControllerOne = viewControllerOne
        self.viewControllerTwo = viewControllerTwo
        self.viewControllerTHree = viewControllerThree
        
        super.init(customViews: [viewControllerOne.customView, viewControllerTwo.customView, viewControllerThree.customView])
        
    }
    
//    override init(customViews: [BaseCustomView]) {
//        
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveToNextView() {
//        pullViewUp()
        print("aya bhai, ruk!")
        handleTapGesture()
    }
    
    deinit {
        print("deinit view controller")
    }
}

