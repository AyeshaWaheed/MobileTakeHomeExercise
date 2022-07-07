//
//  AppRouterTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 06/07/2022.
//

import XCTest
@testable import TakeHomeExercise

class AppRouterTests: XCTestCase {
    
    private var sut: AppRouter!
    private var rootStub: NavigationControllerStub!

    override func setUpWithError() throws {
        
        rootStub = NavigationControllerStub()
        sut = AppRouter(root: rootStub)
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isRootNavigationController_set() {
        XCTAssertNotNil(sut.root)
    }
    
    func test_isTopViewController_repositoryDescription() {
        sut.open(description: "")
        XCTAssertTrue(sut.root.topViewController is RepositoryDescriptionViewController)
    }
    
    func test_isRepositoryDescriptionVC_popped() {
        sut.open(description: "")
        sut.close()
        XCTAssertTrue(rootStub.popCalled)
    }
}

class NavigationControllerStub: UINavigationController {

    var popCalled: Bool = false
    override func popViewController(animated: Bool) -> UIViewController? {
        popCalled = true
        return self.viewControllers.first
    }
}
