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
        setupCollectionView()
        customView.collectionView.reloadData()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        customView.handlePullUpButtonTappedClosure = { [weak self] in
            self?.delegate?.expandView()
            self?.customView.collectionView.reloadData()
        }
        
        customView.handleDownButtonTappedClosure = { [weak self] in
            self?.delegate?.collapseView()
        }
    }
    
}

private typealias DurationSelectionViewInputMethod = DurationSelectionViewController
extension DurationSelectionViewInputMethod: CustomViewStateInput {
    
    func toggleToExpandedView() {
        customView.collapsedTitleContainerView.isHidden = true
        customView.expandedTitleContainerView.isHidden = false
        customView.updateBackgroundColor(isExpanded: true)
    }
    
    func toggleToCollapsedView() {
        customView.updateBackgroundColor(isExpanded: false)
    }
    
    func setupCollectionView() {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
    }

    
}

private typealias CollectionViewDataHandler = DurationSelectionViewController
extension CollectionViewDataHandler: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return EMIData().emi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DurationSelectionView.cellIdentifier, for: indexPath) as? DurationSelectionCollectionViewCell else { return UICollectionViewCell() }
        cell.setupCell(color:  EMIData().color[indexPath.item], text: EMIData().emi[indexPath.item])
        return cell
    }
    
}

private typealias CollectionViewLayoutHandler = DurationSelectionViewController
extension CollectionViewLayoutHandler: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.2 - (Constants.horizontalPadding * 2)
        return .init(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 0, left: Constants.horizontalPadding,
                     bottom: 0, right: Constants.horizontalPadding)
    }
     
}

private typealias Constant = DurationSelectionViewController
private extension Constant {
    
    struct Constants {
        static let horizontalPadding: CGFloat = 8
    }
}
