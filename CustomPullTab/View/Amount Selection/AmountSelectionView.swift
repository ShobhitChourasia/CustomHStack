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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "nikunj, how much do you need?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.customGreyTextColor()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        return label
    }()
    
    private let subTitleLabel: UILabel = {
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
    
//    let tempLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Loading temp..."
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = UIColor.customGreyTextColor()
//        label.font = UIFont.boldSystemFont(ofSize: 15)
//        label.textAlignment = .left
//        return label
//    }()
//
//    let pullUpButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .black
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("Pull Up", for: .normal)
//        button.addTarget(self, action: #selector(upButtonClicked), for: .touchUpInside)
//
//        return button
//    }()
//
//
//    let downButton: UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .brown
//        button.setTitleColor(.white, for: .normal)
//        button.setTitle("Pull down", for: .normal)
//        button.addTarget(self, action: #selector(downButtonClicked), for: .touchUpInside)
//
//        return button
//    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.customBlackColor()
        
        titleContainerView.addSubview(titleLabel)
        titleContainerView.addSubview(subTitleLabel)
        addSubview(titleContainerView)
        
        rotorView.addSubview(rotorSubtitle)
        addSubview(rotorView)
        
        NSLayoutConstraint.activate([
            titleContainerView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            titleContainerView.heightAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: titleContainerView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -44),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleContainerView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: titleContainerView.trailingAnchor),
            subTitleLabel.bottomAnchor.constraint(equalTo: titleContainerView.bottomAnchor),
            
            rotorView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: -32),
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
}
