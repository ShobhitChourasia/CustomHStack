//
//  PaymentModeSelectionViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 15/06/21.
//

import UIKit

class PaymentModeSelectionViewController: CustomViewController<PaymentModeSelectionView> {

    weak var delegate: PullTabViewControllerStackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.handleButtonTappedClosure = { [weak self] in
            self?.delegate?.expandView()
        }
        
        customView.handleDownButtonTappedClosure = { [weak self] in
            self?.delegate?.collapseView()
        }

    }

}

private typealias PaymentModeSelectionViewInputMethod = PaymentModeSelectionViewController
extension PaymentModeSelectionViewInputMethod: CustomViewStateInput {
    
    func toggleToExpandedView() {
        customView.collapsedTitleContainerView.isHidden = true
        customView.expandedTitleContainerView.isHidden = false
        customView.updateBackgroundColor(isExpanded: true)
    }
    
    func toggleToCollapsedView() {
        customView.collapsedTitleContainerView.isHidden = false
        customView.expandedTitleContainerView.isHidden = true
        customView.updateBackgroundColor(isExpanded: false)
    }
    
    
}
