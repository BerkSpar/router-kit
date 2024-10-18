//
//  RouterView.swift
//  RouterKit
//
//  Created by Felipe Passos on 26/09/24.
//

import Foundation
import SwiftUI

/// A SwiftUI view that displays content based on the `Router`'s current navigation stack.
public struct RouterView<Route: Routable>: View {
    
    /// The router object that manages the navigation state for this view.
    @ObservedObject var router: Router<Route>
    
    /// Initializes the `RouterView` with a given root view.
    ///
    /// - Parameter rootView: The initial root view for the `RouterView`.
    public init(rootView: Route) {
        self.router = Router<Route>(
            route: rootView
        )
    }
    
    /// The body of the view, which contains a `NavigationStack` that updates based on the router's stack.
    public var body: some View {
        NavigationStack(path: $router.stack) {
            AnyView(router.root)
                .navigationDestination(for: Route.self) { route in
                    AnyView(route.view)
                        .navigationBarBackButtonHidden(!router.showBackButton)
                }
        }
        .environmentObject(router)
    }
}
