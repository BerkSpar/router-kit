//
//  RouterTests.swift
//  RouterKit
//
//  Created by Gustavo Munhoz Correa on 03/10/24.
//

import SwiftUI
import Testing
@testable import RouterKit

@Suite("Router tests")
struct RouterTests {
    
    @Test("Router is initialized correctly")
    func routerInitialization() {
        let initialRoute = MockRoute()
        
        let router = Router(route: initialRoute)
        
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
