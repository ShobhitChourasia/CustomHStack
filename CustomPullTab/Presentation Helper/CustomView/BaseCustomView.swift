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
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        addGestureRecognizer(tap)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        delegate?.handleTapGesture()
    }
    
}
