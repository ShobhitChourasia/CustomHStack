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
    
    private let titleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
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
        label.text = "nikunj, how much do you need?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.customGreyTextColor()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private let expandedSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "move the dial and set any amount you need upto ₹487,981"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.customGreyTextColor()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .left
        return label
    }()

    private let rotorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    private let rotorSubtitle: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "stash is instant. money will be credited in seconds."
        label.textColor = UIColor.customGreyTextColor()
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    let collapsedTitleContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.customPurpleColor()
        return view
    }()

    private let collapsedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Yes, I need some credit"
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
        button.addTarget(self, action: #selector(upButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.customPurpleColor()
        
        titleContainerView.addSubview(collapsedTitleContainerView)
        titleContainerView.addSubview(expandedTitleContainerView)
        
        collapsedTitleContainerView.addSubview(collapsedTitleLabel)
        collapsedTitleContainerView.addSubview(pullUpButton)
                
        expandedTitleContainerView.addSubview(expandedTitleLabel)
        expandedTitleContainerView.addSubview(expandedSubTitleLabel)
        
        rotorView.addSubview(rotorSubtitle)
        addSubview(rotorView)
        addSubview(titleContainerView)
        
        NSLayoutConstraint.activate([
            titleContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            titleContainerView.heightAnchor.constraint(equalToConstant: 100),
            
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
            
            rotorView.topAnchor.constraint(equalTo: titleContainerView.bottomAnchor, constant: -32),
            rotorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            rotorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            rotorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -250),
            
            rotorSubtitle.bottomAnchor.constraint(equalTo: rotorView.bottomAnchor, constant: -16),
            rotorSubtitle.leadingAnchor.constraint(equalTo: rotorView.leadingAnchor, constant: 16),
            rotorSubtitle.trailingAnchor.constraint(equalTo: rotorView.trailingAnchor, constant: -16),
            rotorSubtitle.heightAnchor.constraint(equalToConstant: 20)
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
    
    func updateBackgroundColor(isExpanded: Bool) {
        backgroundColor = isExpanded ? UIColor.customBlackColor() : UIColor.customPurpleColor()
    }

}
