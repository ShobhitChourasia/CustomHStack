//
//  DurationSelectionCollectionViewCell.swift
//  CustomPullTab
//
//  Created by Shobhit on 27/06/21.
//

import UIKit

class DurationSelectionCollectionViewCell: UICollectionViewCell {
    
    private let emiLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightText
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupCell()
        
        addSubview(emiLabel)
        
        NSLayoutConstraint.activate([
            emiLabel.topAnchor.constraint(equalTo: topAnchor),
            emiLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            emiLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            emiLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell UI Setup
    
    func setupCell(color: UIColor, text: String) {
        backgroundColor = color
        emiLabel.text = text
    }
    
}


private typealias CellUI = DurationSelectionCollectionViewCell
private extension CellUI {
    
    func setupCell() {
        backgroundColor = .clear
        clipsToBounds = true
        layer.cornerRadius = 10
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
    }
    
}
