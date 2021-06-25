//
//  DurationSelectionViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 15/06/21.
//

import UIKit

class DurationSelectionViewController: CustomViewController<DurationSelectionView> {
    
    weak var delegate: PullTabViewControllerStackDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.backgroundColor = .brown
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        customView.handleButtonTappedClosure = { [weak self] in
            self?.delegate?.expandView()
        }
        
        customView.handleDownButtonTappedClosure = { [weak self] in
            self?.delegate?.collapseView()
        }
    }
    
}

private typealias DurationSelectionViewInputMethod = DurationSelectionViewController
extension DurationSelectionViewInputMethod: CustomViewStateInput {
    
    func toggleToExpandedView() {
        customView.backgroundColor = .cyan
    }
    
    func toggleToCollapsedView() {
        print("Collapsed DurationSelectionView")
    }
    
}

