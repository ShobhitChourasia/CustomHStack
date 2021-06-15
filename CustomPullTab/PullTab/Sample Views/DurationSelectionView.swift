//
//  DurationSelectionView.swift
//  CustomPullTab
//
//  Created by Shobhit on 14/06/21.
//

import UIKit

class DurationSelectionView: BaseCustomView {
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tempLabel)
        NSLayoutConstraint.activate([
            tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
