//
//  ViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 13/06/21.
//

import UIKit

protocol CustomViewStateInput {
    
    func toggleToCollapsedView()
    func toggleToExpandedView()
    func handleMinimizedView()
    
}

class ViewController: PullTabViewController, PullTabViewControllerStackDelegate {

    let downButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Pull down", for: .normal)
        button.addTarget(self, action: #selector(downButtonClicked), for: .touchUpInside)
        return button
    }()

    let upButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Pull up", for: .normal)
        button.addTarget(self, action: #selector(upButtonClicked), for: .touchUpInside)
        return button
    }()

    @objc func downButtonClicked() {
        pullViewDown()
    }

    @objc func upButtonClicked() {
        handleTapGesture()
    }

    private let viewControllerOne: AmountSelectionViewController
    private let viewControllerTwo: DurationSelectionViewController
    private let viewControllerThree: PaymentModeSelectionViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(upButton)
        view.addSubview(downButton)
        NSLayoutConstraint.activate([
            upButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            upButton.heightAnchor.constraint(equalToConstant: 40),
            upButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            upButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            downButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            downButton.heightAnchor.constraint(equalToConstant: 40),
            downButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            downButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        view.backgroundColor = .white
        viewControllerOne.delegate = self
        viewControllerTwo.delegate = self
        viewControllerThree.delegate = self
        
        viewStatusDelegate = self
    }


    init(viewControllerOne: AmountSelectionViewController, viewControllerTwo: DurationSelectionViewController,
         viewControllerThree: PaymentModeSelectionViewController) {
        
        self.viewControllerOne = viewControllerOne
        self.viewControllerTwo = viewControllerTwo
        self.viewControllerThree = viewControllerThree
        
        super.init(customViews: [viewControllerOne.customView, viewControllerTwo.customView, viewControllerThree.customView])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func expandView() {
        handleTapGesture()
    }
    
    func collapseView() {
        pullViewDown()
    }
}

// MARK: - PullTabViewControllerStatusDelegate

private typealias DelegateHandler = ViewController
extension DelegateHandler: PullTabViewControllerStatusDelegate {
    
    func viewExpanded(view: UIView) {
        switch view {
        case is AmountSelectionView:
            viewControllerOne.toggleToExpandedView()
        case is DurationSelectionView:
            viewControllerTwo.toggleToExpandedView()
        case is PaymentModeSelectionView:
            viewControllerThree.toggleToExpandedView()
        default: break
        }
    }
    
    func viewCollapsed(view: UIView) {
        switch view {
        case is AmountSelectionView:
            viewControllerOne.toggleToCollapsedView()
        case is DurationSelectionView:
            viewControllerTwo.toggleToCollapsedView()
        case is PaymentModeSelectionView:
            viewControllerThree.toggleToCollapsedView()
        default: break
        }
    }
    
    func previousViewMinimized(view: UIView) {
        switch view {
        case is AmountSelectionView:
            viewControllerOne.handleMinimizedView()
        case is DurationSelectionView:
            viewControllerTwo.handleMinimizedView()
        case is PaymentModeSelectionView:
            viewControllerThree.handleMinimizedView()
        default: break
        }
    }
    
}
