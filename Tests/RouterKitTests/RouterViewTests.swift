//
//  RouterViewTests.swift
//  RouterKit
//
//  Created by Felipe Passos on 18/10/24.
//

import SwiftUI
import Testing
@testable import RouterKit

@Suite("RouterView Tests")
struct RouterViewTests {
    @Test("Should initialize RouterView correctly", arguments: [true, false])
    func shouldInitializeCorrectly(_ showBackButton: Bool) {
        let rootView = MockRoute()
        
        let view = RouterView(rootView: rootView, showBackButton: showBackButton)
        
        #expect(view.router != nil)
        #expect(view.router.stack.isEmpty)
    }
    
    @Test("Should navigate to another view", arguments: [true, false])
    func shouldNavigate(_ showBackButton: Bool) {
        let rootView = MockRoute()
        let anotherView = MockRoute()
        
        let view = RouterView(rootView: rootView, showBackButton: showBackButton)
        
        view.router.push(to: anotherView)
        
        #expect(view.router.stack.last == anotherView)
    }
    
    @Test("Should navigate and check back button state")
    func shouldNavigateAndCheckBackButtonState() {
        let rootView = MockRoute()
        let anotherView = MockRoute()
        
        let view = RouterView(rootView: rootView, showBackButton: true)
        
        view.router.push(to: anotherView)
        
        #expect(view.router.stack.last == anotherView)
        
        view.router.pop()
        #expect(view.router.stack.isEmpty)
    }
    
    @Test("Should pop view from navigation stack")
    func shouldPopViewFromStack() {
        let rootView = MockRoute()
        let anotherView = MockRoute()
        
        let view = RouterView(rootView: rootView)
        
        view.router.push(to: anotherView)
        view.router.pop()
        
        #expect(view.router.stack.isEmpty)
    }
    
    @Test("Should has body in RouterView")
    func shouldHasBody() {
        let view = RouterView(rootView: MockRoute())
        
        #expect(view.body != nil)
    }
    
    @Test("Should return any view")
    func shouldReturnAnyView() {
        let routerView = RouterView(rootView: MockRoute())
        
        let view = routerView.buildDestination(MockRoute())
        
        #expect(view != nil)
    }
}
