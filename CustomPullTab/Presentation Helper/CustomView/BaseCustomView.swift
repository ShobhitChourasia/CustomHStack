//
//  BaseCustomView.swift
//  CustomPullTab
//
//  Created by Shobhit on 14/06/21.
//

import UIKit

protocol CustomViewDelegate {
    func handleTapGesture()
}

open class BaseCustomView: UIView {
    
    var delegate: CustomViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.handleTapGesture()
    }
    
}

private typealias SetupUI = BaseCustomView
private extension SetupUI {
    
    func setupUI() {
        layer.cornerRadius = 10
    }
}
