//
//  AmountSelectionView.swift
//  CustomPullTab
//
//  Created by Shobhit on 14/06/21.
//

import UIKit

class AmountSelectionView: BaseCustomView {

    let loadingLabel: UILabel = {
        let label = UILabel()
//        label.isHidden = true
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()

//    override func setupViews() {
//        addSubview(loadingLabel)
//        NSLayoutConstraint.activate([
//            
//            
//
//            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
//            loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
//        ])
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(loadingLabel)
        NSLayoutConstraint.activate([
            
            

            loadingLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
