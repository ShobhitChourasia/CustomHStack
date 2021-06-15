//
//  CustomViewController.swift
//  CustomPullTab
//
//  Created by Shobhit on 15/06/21.
//

import UIKit

open class CustomViewController<View: UIView>: UIViewController {

    // MARK: - Properties
    public var customView: View {
        view as! View
    }

    // MARK: - Life Cycle
    override open func loadView() {
        view = View(frame: UIScreen.main.bounds)
    }

}
