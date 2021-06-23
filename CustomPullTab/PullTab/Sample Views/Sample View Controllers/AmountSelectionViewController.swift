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
        delegate?.expandView()
        customView.backgroundColor = .blue
        customView.handleUpButtonTappedClosure = { [weak self] in
            self?.delegate?.expandView()
        }

        customView.handleDownButtonTappedClosure = { [weak self] in
            self?.delegate?.collapseView()
        }
    }

}

private typealias AmountSelectionViewInputMethod = AmountSelectionViewController
extension AmountSelectionViewInputMethod: CustomViewStateInput {
    
    func toggleToExpandedView() {
        customView.backgroundColor = .systemBlue
//        print("Expanded AmountSelectionViewInput")
    }
    
    func toggleToCollapsedView() {
//        print("Collapsed AmountSelectionViewInput")
    }
    
}
