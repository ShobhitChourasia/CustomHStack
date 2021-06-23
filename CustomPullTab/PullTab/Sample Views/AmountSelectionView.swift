//
//  AmountSelectionView.swift
//  CustomPullTab
//
//  Created by Shobhit on 14/06/21.
//

import UIKit

class AmountSelectionView: BaseCustomView {
    
    var handleUpButtonTappedClosure: (() -> ())?
    var handleDownButtonTappedClosure: (() -> ())?
    
    let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading temp..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .purple
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    let pullUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Pull Up", for: .normal)
        button.addTarget(self, action: #selector(upButtonClicked), for: .touchUpInside)

        return button
    }()
    
    
    let downButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Pull down", for: .normal)
        button.addTarget(self, action: #selector(downButtonClicked), for: .touchUpInside)

        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadingLabel)
//        addSubview(tempLabel)
        addSubview(pullUpButton)
        addSubview(downButton)
        NSLayoutConstraint.activate([
//            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            loadingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -100),
            loadingLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            loadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingLabel.heightAnchor.constraint(equalToConstant: 30),
            
//            tempLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//            tempLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
//            tempLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            pullUpButton.leadingAnchor.constraint(equalTo: leadingAnchor),
//            pullUpButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            pullUpButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            pullUpButton.trailingAnchor.constraint(equalTo: downButton.leadingAnchor),
            
            downButton.leadingAnchor.constraint(equalTo: pullUpButton.trailingAnchor),
            downButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func upButtonClicked() {
        handleUpButtonTappedClosure?()
    }
    
    @objc func downButtonClicked() {
        handleDownButtonTappedClosure?()
    }
}
