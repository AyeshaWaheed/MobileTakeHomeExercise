//
//  TrendingRepositoriesViewControllerTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 25/06/2022.
//

import XCTest
@testable import TakeHomeExercise

class TrendingRepositoriesViewControllerTests: XCTestCase {
    
    private var sut: TrendingRepositoriesViewController!

    override func setUpWithError() throws {
        
        sut = TrendingRepositoriesViewController(viewModel: TrendingRepositoriesViewModel(repository: TrendRepositoryStub()))
    }

    override func tearDownWithError() throws {
        
        sut = nil
    }

    func test_file_nibName() {
        let expectedValue = "BaseViewController"
        XCTAssertEqual(expectedValue, sut.nibName)
    }
    
    func test_viewDidLoad_setNavTitle() {
        let expectedValue = "Trending"
        sut.loadViewIfNeeded()
        XCTAssertEqual(expectedValue, sut.title)
    }
    
    func test_viewDidLoad_configureTableView() {
        sut.loadViewIfNeeded()
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertNotNil(sut.tableView.prefetchDataSource)
    }
    
    func test_tableView_initialState() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(0, sut.numberOfSection())
    }
    
    func test_tableView_fetchDataFromApi() {
        viewDidAppear()
        XCTAssertEqual(3, sut.numberOfSection())
    }
    
    func test_tableViewData_atIndex() {
        viewDidAppear()
        XCTAssertEqual("ant-design", sut.ownerName(row: 1))
        XCTAssertEqual("https://avatars.githubusercontent.com/u/12101536?v=4", sut.profileURL(row: 1))
        XCTAssertEqual("ant-design", sut.getRepositoryName(row: 1))
        XCTAssertEqual("An enterprise-class UI design language and React UI library", sut.getRepositoryDescription(row: 1))
        XCTAssertEqual("TypeScript", sut.getLanguage(row: 1))
        XCTAssertEqual("80794", sut.getStarCount(row: 1))
    }
    
    func test_errorView_initialState() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(true, sut.loadingErrorView?.isHidden)
    }
    
    func test_errorView_afterFetchingDataFromAPi() {
        viewDidAppear()
        XCTAssertEqual(true, sut.loadingErrorView?.isHidden)
    }
    
    func viewDidAppear() {
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }
}

//MARK: - For Testing

private extension TrendingRepositoriesViewController {
    
    var userSection: Int { 0 }
    
    func numberOfSection() -> Int {
        tableView.numberOfRows(inSection: userSection)
    }
    
    func ownerName(row: Int) -> String? {
        repositoryCell(row: row)?.getOwnerName()
    }
    
    func profileURL(row: Int) -> String? {
        repositoryCell(row: row)?.getProfileURL()
    }
    
    func getRepositoryName(row: Int) -> String? {
        repositoryCell(row: row)?.getRepositoryName()
    }
    
    func getRepositoryDescription(row: Int) -> String? {
        repositoryCell(row: row)?.getRepositoryDescription()
    }
    
    func getLanguage(row: Int) -> String? {
        repositoryCell(row: row)?.getLanguage()
    }
    
    func getStarCount(row: Int) -> String? {
        repositoryCell(row: row)?.getStarCount()
    }
    
    func repositoryCell(row: Int) -> TrendingRepositoryTableViewCellViewModelType? {
        let dataSource = tableView.dataSource
        let indexPath = IndexPath(row: row, section: userSection)
        let cell = dataSource?.tableView(tableView, cellForRowAt: indexPath) as? TrendingRepositoryTableViewCell
        return cell?.viewModel
    }
    
}
