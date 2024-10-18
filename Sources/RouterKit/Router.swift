//
//  Router.swift
//  RouterKit
//
//  Created by Felipe Passos on 26/09/24.
//

import Foundation
import SwiftUI

/// A class responsible for managing navigation in a SwiftUI app.
/// Uses a `NavigationPath` to control the stack of views and supports pushing, popping,
/// and replacing the root view.
public class Router<Route: Routable>: ObservableObject {
    
    /// The navigation stack that tracks the current routes.
    @Published var stack: [Route] = []
    
    /// The root view of the navigation, displayed when no routes are on the stack.
    @Published var root: any View
    
    /// Define if showBackButton by default. The default value is true.
    @Published var showBackButton: Bool
    
    /// Initializes the `Router` with a given root view.
    ///
    /// - Parameter root: The initial view displayed by the router.
    public init(route: Route, showBackButton: Bool = true) {
        self.root = route.view
        self.showBackButton = showBackButton
    }
    
    /// Pushes a new route onto the navigation stack.
    ///
    /// - Parameters:
    ///   - route: The route to push onto the stack.
    ///   - animate: A flag that determines whether the navigation should be animated (default is `true`).
    public func push(to route: Route, animate: Bool = true) {
        if !animate {
            pushWithoutAnimation(to: route)
            return
        }
        
        stack.append(route)
    }
    
    /// Pushes a new route onto the navigation stack without animation.
    ///
    /// - Parameter route: The route to push onto the stack.
    private func pushWithoutAnimation(to route: Route) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        
        withTransaction(transaction) {
            stack.append(route)
        }
    }
    
    /// Replaces the current root view with a new view and clears the navigation stack.
    ///
    /// - Parameter route: The new root view to be displayed.
    public func replaceRootView(to route: Route) {
        popToRoot()
        root = route.view
    }

    /// Pops the last route off the navigation stack, if any.
    public func pop() {
        if !stack.isEmpty {
            stack.removeLast()
        }
    }
    
    /// Pops until find the route.
    ///
    /// If not find the route, it's clear the stack.
    ///
    /// - Parameter route: The route expected to stop the pop.
    public func popUntil(route: Route) {
        for item in stack.reversed() {
            if item == route {
                return
            }
            
            pop()
        }
    }
    
    /// Pops until condition return true.
    ///
    /// If not find the route, it's clear the stack.
    ///
    /// - Parameter condition: The condition to stop the pop.
    public func popWhere(condition: (Route) -> Bool) {
        for item in stack.reversed() {
            if condition(item) {
                return
            }
            
            pop()
        }
    }
    
    /// Pops all routes and resets the stack to the root view.
    public func popToRoot() {
        stack = []
    }
}

