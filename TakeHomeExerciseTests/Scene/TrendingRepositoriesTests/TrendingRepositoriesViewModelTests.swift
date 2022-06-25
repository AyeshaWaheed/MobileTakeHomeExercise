//
//  TrendingRepositoriesViewModelTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 25/06/2022.
//

import XCTest
@testable import TakeHomeExercise

class TrendingRepositoriesViewModelTests: XCTestCase {
    
    private var sut: TrendingRepositoriesViewModel!
    private var repositoryStub: TrendRepositoryStub!

    override func setUpWithError() throws {
        
        repositoryStub = TrendRepositoryStub()
        sut = TrendingRepositoriesViewModel(repository: repositoryStub)
    }

    override func tearDownWithError() throws {
        
        sut = nil
        repositoryStub = nil
    }

    func test_getNavTitle() {
        let expectedValue = "Trending"
        XCTAssertEqual(expectedValue, sut.getNavTitle())
    }
    
    func test_RenderDataFromAPi() {
        let expectedValue = TrendModel.mocked.items
        sut.getTrendingRepositories()
        XCTAssertEqual(expectedValue, sut.itemModel)
    }
    
    func test_generateCellViewModels() {
        sut.getTrendingRepositories()
        XCTAssertNotNil(sut.cellViewModels.count)
    }
    
    func test_setNumberOfRows() {
        sut.getTrendingRepositories()
        XCTAssertEqual(sut.cellViewModels.count, sut.setNumberOfRows())
    }
    
    func test_cellForRowAtIndexPath() {
        sut.getTrendingRepositories()
        XCTAssertNotNil(sut.cellForRowAtIndexPath(indexPath: IndexPath(row: 0, section: 0)))
    }

}
