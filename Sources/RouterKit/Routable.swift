//
//  Routable.swift
//  RouterKit
//
//  Created by Felipe Passos on 26/09/24.
//

import SwiftUI

/// A protocol that defines the requirements for any type that can be used as a route in the `Router`.
/// Conforming types must be hashable and provide a `view` property that returns a SwiftUI `View`.
public protocol Routable: Hashable {
    /// The view that will be displayed when the route is activated.
    var view: any View { get }
}
