//
//  AmountSelectionViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 15/06/21.
//

import UIKit

class AmountSelectionViewController: CustomViewController<AmountSelectionView> {

    weak var delegate: PullTabViewControllerStackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.moveToNextView()
        customView.backgroundColor = .blue
        customView.handleButtonTappedClosure = { [weak self] in
            self?.delegate?.moveToNextView()
        }

    }

}

private typealias AmountSelectionViewInputMethod = AmountSelectionViewController
extension AmountSelectionViewInputMethod: CustomViewStateInput {
    
    func toggleToCollapsedView() {
        print("Collapsed AmountSelectionViewInput")
    }
    
    func toggleToExpandedView() {
        print("Expanded AmountSelectionViewInput")
    }
}
