//
//  TrendingRepositoryTableViewCellViewModelTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 25/06/2022.
//

import XCTest
@testable import TakeHomeExercise

class TrendingRepositoryTableViewCellViewModelTests: XCTestCase {
    
    private var sut: TrendingRepositoryTableViewCellViewModel!

    override func setUpWithError() throws {
        
        sut = TrendingRepositoryTableViewCellViewModel(itemModel: TrendModel.mocked.items[0])
    }

    override func tearDownWithError() throws {
    
        sut = nil
    }
    
    func test_getProfileURL() {
        let expectedValue = "https://avatars.githubusercontent.com/u/4314092?v=4"
        XCTAssertEqual(expectedValue, sut.getProfileURL())
    }
    
    func test_getOwnerName() {
        let expectedValue = "golang"
        XCTAssertEqual(expectedValue, sut.getOwnerName())
    }
    
    func test_getRepositoryName() {
        let expectedValue = "go"
        XCTAssertEqual(expectedValue, sut.getRepositoryName())
    }
    
    func test_getRepositoryDescription() {
        let expectedValue = "The Go programming language"
        XCTAssertEqual(expectedValue, sut.getRepositoryDescription())
    }
    
    func test_getLanguage() {
        let expectedValue = "Go"
        XCTAssertEqual(expectedValue, sut.getLanguage())
    }
    
    func test_getStarCount() {
        let expectedValue = "100876"
        XCTAssertEqual(expectedValue, sut.getStarCount())
    }
    
    func test_languageHide() {
        XCTAssertEqual(true, sut.languageHideView(language: ""))
    }
}
