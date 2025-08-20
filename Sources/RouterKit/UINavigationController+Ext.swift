//
//  UINavigationController+Ext.swift
//  RouterKit
//
//  Created by Felipe Passos on 18/10/24.
//

#if canImport(UIKit)

import UIKit

extension UINavigationController: @retroactive UIGestureRecognizerDelegate {
    public static var isSwipeBackEnabled: Bool = true
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (!UINavigationController.isSwipeBackEnabled) {
            return false
        }
        
        return viewControllers.count > 1
    }
}

#endif
