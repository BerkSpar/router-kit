//
//  MockAppRoute.swift
//  RouterKit
//
//  Created by Felipe Passos on 18/10/24.
//

import SwiftUI
@testable import RouterKit

enum MockAppRoute: Routable {
    case home
    case another
    
    var view: any View {
        switch self {
            case .home: Text("Mock View")
            case .another: Text("Another")
        }
    }
}
