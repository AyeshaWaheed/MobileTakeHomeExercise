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

    override func setUpWithError() throws {
        sut = AppRouter()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_isRootNavigationController_set() {
        XCTAssertNotNil(sut.root)
    }

}
