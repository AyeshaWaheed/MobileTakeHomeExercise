//
//  RepositoryDescriptionViewModel.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 06/07/2022.
//

import XCTest
@testable import TakeHomeExercise

class RepositoryDescriptionViewModelTests: XCTestCase {
    
    var sut: RepositoryDescriptionViewModelType!

    override func setUp() {
        sut = RepositoryDescriptionViewModel(repositoryDescription: "abc testing")
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_getRepositoryDescription() {
        let expectedValue = "abc testing"
        XCTAssertEqual(expectedValue, sut.getRepositoryDescription())
    }

}
