//
//  DurationSelectionView.swift
//  CustomPullTab
//
//  Created by Shobhit on 14/06/21.
//

import UIKit

class DurationSelectionView: BaseCustomView {
    
    var handleButtonTappedClosure: (() -> ())?
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 6.0
        button.isUserInteractionEnabled = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.green.cgColor
        button.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tempLabel)
        addSubview(searchButton)
        NSLayoutConstraint.activate([
            tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            searchButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 200),
            searchButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func handleSearchButton() {
        handleButtonTappedClosure?()
    }

}
