//
//  PaymentModeSelectionView.swift
//  CustomPullTab
//
//  Created by Shobhit on 14/06/21.
//

import UIKit

class PaymentModeSelectionView: BaseCustomView {

    var handleButtonTappedClosure: (() -> ())?
    var handleDownButtonTappedClosure: (() -> ())?
    
    private let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.backgroundColor = .clear
        return view
    }()
    
    let collapsedTitleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.customPurpleColor()
        return view
    }()

    
    private let collapsedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Select your bank account"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.customPinkTextColor()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

    let pullUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(handlePullUpButton), for: .touchUpInside)
        return button
    }()

    let expandedTitleContainerView: UIView = {
        let view = UIView()
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.customBlackColor()
        return view
    }()
    
    private let expandedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "where should we send the money?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.customGreyTextColor()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()

    private let expandedSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "amount will be credited to this bank account. EMI will also be debited from this bank account."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.customGreyTextColor()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.customPurpleColor()
        
        titleContainerView.addSubview(collapsedTitleContainerView)
        titleContainerView.addSubview(expandedTitleContainerView)
        
        collapsedTitleContainerView.addSubview(collapsedTitleLabel)
        collapsedTitleContainerView.addSubview(pullUpButton)
        addSubview(titleContainerView)
        
        expandedTitleContainerView.addSubview(expandedTitleLabel)
        expandedTitleContainerView.addSubview(expandedSubTitleLabel)
        
        NSLayoutConstraint.activate([
            titleContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            titleContainerView.heightAnchor.constraint(equalToConstant: 100),
            
            collapsedTitleContainerView.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            collapsedTitleContainerView.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            collapsedTitleContainerView.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            collapsedTitleContainerView.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            pullUpButton.topAnchor.constraint(equalTo: collapsedTitleContainerView.topAnchor),
            pullUpButton.leadingAnchor.constraint(equalTo: collapsedTitleContainerView.leadingAnchor),
            pullUpButton.trailingAnchor.constraint(equalTo: collapsedTitleContainerView.trailingAnchor),
            pullUpButton.bottomAnchor.constraint(equalTo: collapsedTitleContainerView.bottomAnchor),
            
            collapsedTitleLabel.topAnchor.constraint(equalTo: collapsedTitleContainerView.topAnchor, constant: 16),
            collapsedTitleLabel.leadingAnchor.constraint(equalTo: collapsedTitleContainerView.leadingAnchor),
            collapsedTitleLabel.trailingAnchor.constraint(equalTo: collapsedTitleContainerView.trailingAnchor),
            
            expandedTitleContainerView.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            expandedTitleContainerView.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            expandedTitleContainerView.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            expandedTitleContainerView.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            expandedTitleLabel.topAnchor.constraint(equalTo: expandedTitleContainerView.topAnchor),
            expandedTitleLabel.leadingAnchor.constraint(equalTo: expandedTitleContainerView.leadingAnchor),
            expandedTitleLabel.trailingAnchor.constraint(equalTo: expandedTitleContainerView.trailingAnchor),
            
            expandedSubTitleLabel.topAnchor.constraint(equalTo: expandedTitleLabel.bottomAnchor, constant: -44),
            expandedSubTitleLabel.leadingAnchor.constraint(equalTo: expandedTitleContainerView.leadingAnchor),
            expandedSubTitleLabel.trailingAnchor.constraint(equalTo: expandedTitleContainerView.trailingAnchor),
            expandedSubTitleLabel.bottomAnchor.constraint(equalTo: expandedTitleContainerView.bottomAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handlePullUpButton() {
        handleButtonTappedClosure?()
    }

    @objc func downButtonClicked() {
        handleDownButtonTappedClosure?()
    }
    
    func updateBackgroundColor(isExpanded: Bool) {
        backgroundColor = isExpanded ? UIColor.customBlackColor() : UIColor.customPurpleColor()
    }

}
