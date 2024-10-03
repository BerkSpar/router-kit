//
//  MockRoute.swift
//  RouterKit
//
//  Created by Gustavo Munhoz Correa on 03/10/24.
//

import SwiftUI
@testable import RouterKit

struct MockRoute: Routable {
    let id = UUID()
    
    var view: any View {
        Text("Mock View")
    }
}
