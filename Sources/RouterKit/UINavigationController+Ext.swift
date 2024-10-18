//
//  UINavigationController+Ext.swift
//  RouterKit
//
//  Created by Felipe Passos on 18/10/24.
//

#if canImport(UIKit)

import UIKit

public extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}

#endif
