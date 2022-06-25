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
        let expectedValue = expectedMockData().items
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
    
    func expectedMockData() -> TrendModel {
        return TrendModel(items: [
            ItemModel(name: "go", description: "The Go programming language", language: "Go", stargazers_count: 100876, owner: OwnerModel(login: "golang", avatar_url: "https://avatars.githubusercontent.com/u/4314092?v=4")),
            ItemModel(name: "ant-design", description: "An enterprise-class UI design language and React UI library", language: "TypeScript", stargazers_count: 80794, owner: OwnerModel(login: "ant-design", avatar_url: "https://avatars.githubusercontent.com/u/12101536?v=4")),
            ItemModel(name: "swift", description: "The Swift Programming Language", language: "C++", stargazers_count: 59916, owner: OwnerModel(login: "apple", avatar_url: "https://avatars.githubusercontent.com/u/10639145?v=4"))
        ])
    }
}



