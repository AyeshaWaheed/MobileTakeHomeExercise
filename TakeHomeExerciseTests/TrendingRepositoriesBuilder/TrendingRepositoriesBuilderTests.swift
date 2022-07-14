//
//  TrendingRepositoriesBuilderTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 14/07/2022.
//

import XCTest
@testable import TakeHomeExercise

class TrendingRepositoriesBuilderTests: XCTestCase {
    
    private var sut: TrendingRepositoriesBuilder!

    override func setUpWithError() throws {
        sut = TrendingRepositoriesBuilder()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_routerDelegate_configure() {
        let navigationController = sut.make()
        if let viewController = navigationController.topViewController as? TrendingRepositoriesViewController {
            XCTAssertNotNil(viewController.routerDelegate)
        }
    }
}
