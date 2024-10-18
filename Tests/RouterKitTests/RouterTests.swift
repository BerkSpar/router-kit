//
//  RouterTests.swift
//  RouterKit
//
//  Created by Gustavo Munhoz Correa on 03/10/24.
//

import SwiftUI
import Testing
@testable import RouterKit

@Suite("Router Tests")
struct RouterTests {
    
    @Test("Router is initialized correctly", arguments: [true, false])
    func routerInitialization(_ showBackButton: Bool) {
        let initialRoute = MockRoute()
        
        let router = Router(
            route: initialRoute,
            showBackButton: showBackButton
        )
        
        #expect(router.root is Text)
        #expect(router.stack.isEmpty)
    }
    
    @Test("Router push adds view to stack", arguments: [true, false])
    func pushRoute(_ animated: Bool) {
        let initialRoute = MockRoute()
        let router = Router(route: initialRoute)
        let newRoute = MockRoute()
        
        router.push(to: newRoute, animate: animated)
        
        #expect(router.stack.count == 1)
    }
    
    @Test("Router pop removes view from stack", arguments: [true, false])
    func popRoute(_ animated: Bool) {
        let initialRoute = MockRoute()
        let router = Router(route: initialRoute)
        let route1 = MockRoute()
        let route2 = MockRoute()
        
        router.push(to: route1)
        router.push(to: route2)
                
        router.pop()
        
        #expect(router.stack.count == 1)
    }
    
    @Test("Router pop on empty stack has no effect")
    func popOnEmptyStack() {
        let initialRoute = MockRoute()
        let router = Router(route: initialRoute)
        
        router.pop()
        
        #expect(router.stack.isEmpty)
        #expect(router.root is Text)
    }
    
    @Test("Router pop until the view")
    func popUntilView() {
        let route1 = MockRoute()
        let route2 = MockRoute()
        let route3 = MockRoute()
        
        let router = Router(route: route1)
        
        router.push(to: route2)
        router.push(to: route3)
        
        router.popUntil(route: route2)
        
        #expect(router.stack.last == route2)
    }
    
    @Test("Router pop until the view and not find")
    func popUntilRoot() {
        let route1 = MockRoute()
        let route2 = MockRoute()
        let route3 = MockRoute()
        
        let router = Router(route: route1)
        
        router.push(to: route3)
        router.push(to: route3)
        
        router.popUntil(route: route2)
        
        #expect(router.stack.isEmpty)
    }
    
    @Test("Router pop where find route")
    func popWhereFindRoute() {
        let route1 = MockRoute()
        let route2 = MockRoute()
        let route3 = MockRoute()
        
        let router = Router(route: route1)
        
        router.push(to: route2)
        router.push(to: route3)
        
        router.popWhere { route in
            route.id == route2.id
        }
        
        #expect(router.stack.last == route2)
    }
    
    @Test("Router pop where find route and not find")
    func popWhereFindRouteAndNotFind() {
        let route1 = MockRoute()
        let route2 = MockRoute()
        let route3 = MockRoute()
        
        let router = Router(route: route1)
        
        router.push(to: route2)
        router.push(to: route3)
        
        router.popWhere { route in
            false
        }
        
        #expect(router.stack.isEmpty)
    }
    
    @Test("Router pop to root clears the stack")
    func popToRoot() {
        let initialRoute = MockRoute()
        let router = Router(route: initialRoute)
        let route1 = MockRoute()
        let route2 = MockRoute()
        
        router.push(to: route1)
        router.push(to: route2)
        
        router.popToRoot()
        
        #expect(router.stack.isEmpty)
        #expect(router.root is Text)
    }
    
    @Test("Router replaces root and cleans stack")
    func replaceRoot() {
        let initialRoute = MockRoute()
        let router = Router(route: initialRoute)
        
        let route1 = MockRoute()
        router.push(to: route1)
        
        let newRootRoute = MockRoute()
        router.replaceRootView(to: newRootRoute)
        
        #expect(router.stack.isEmpty)
        #expect(router.root is Text)
    }
}
