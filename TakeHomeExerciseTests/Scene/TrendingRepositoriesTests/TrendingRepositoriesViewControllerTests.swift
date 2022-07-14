//
//  TrendingRepositoriesViewControllerTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 25/06/2022.
//

import XCTest
@testable import TakeHomeExercise

enum TrendingRepositoriesTestsStrings {
    static var ownerName = "ant-design"
    static var profileURL = "https://avatars.githubusercontent.com/u/12101536?v=4"
    static var repositoryName = "ant-design"
    static var repositoryDescription = "An enterprise-class UI design language and React UI library"
    static var language = "TypeScript"
    static var starCount = "80794"
    static var navTitle = "Trending"
}

class TrendingRepositoriesViewControllerTests: XCTestCase {
    
    private var sut: TrendingRepositoriesViewController!
    private var appRouterStub: AppRouterStub!
    
    override func setUpWithError() throws {
        sut = TrendingRepositoriesViewController(viewModel: makeBuilder())
        appRouterStub = AppRouterStub(root: UINavigationController())
        sut.routerDelegate = appRouterStub
    }

    override func tearDownWithError() throws {
        sut = nil
        appRouterStub = nil
    }

    func test_file_nibName() {
        let expectedValue = "BaseViewController"
        XCTAssertEqual(expectedValue, sut.nibName)
    }
    
    func test_viewDidLoad_setNavTitle() {
        let expectedValue = TrendingRepositoriesTestsStrings.navTitle
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
        XCTAssertEqual(0, numberOfSection())
    }
    
    func test_tableView_fetchDataFromApi() {
        viewDidAppear()
        XCTAssertEqual(3, numberOfSection())
    }
    
    func test_tableViewData_atIndex() {
        viewDidAppear()
        XCTAssertEqual(TrendingRepositoriesTestsStrings.ownerName, ownerName(row: 1))
        XCTAssertEqual(TrendingRepositoriesTestsStrings.profileURL, profileURL(row: 1))
        XCTAssertEqual(TrendingRepositoriesTestsStrings.repositoryName, getRepositoryName(row: 1))
        XCTAssertEqual(TrendingRepositoriesTestsStrings.repositoryDescription, getRepositoryDescription(row: 1))
        XCTAssertEqual(TrendingRepositoriesTestsStrings.language, getLanguage(row: 1))
        XCTAssertEqual(TrendingRepositoriesTestsStrings.starCount, getStarCount(row: 1))
    }
    
    func test_errorView_initialState() {
        sut.loadViewIfNeeded()
        XCTAssertEqual(true, sut.loadingErrorView?.isHidden)
    }
    
    func test_errorView_afterFetchingDataFromAPi() {
        viewDidAppear()
        XCTAssertEqual(true, sut.loadingErrorView?.isHidden)
    }
    
//    func test_errorView_ifAPiFail() {    //Run only for error case
//        viewDidAppear()
//
//        let exp = expectation(description: "Waiting")
//        exp.isInverted = true
//        wait(for: [exp], timeout: 2.0)
//
//        XCTAssertEqual(false, sut.loadingErrorView?.isHidden)
//    }
    
    func test_didSelectRow_delegateOpenCalled() {
        viewDidAppear()
        let indexPath = IndexPath(row: 1, section: userSection)
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)
        if let appRouterStub = sut.routerDelegate as? AppRouterStub {
            XCTAssertEqual(true, appRouterStub.isOpenCalled)
        }
    }
}

//MARK: - For Testing

private extension TrendingRepositoriesViewControllerTests {
    
    func makeBuilder() -> TrendingRepositoriesViewModelType {
        let repositoryStub = TrendRepositoryStub()
        return TrendingRepositoriesViewModel(repository: repositoryStub)
    }
    
    func viewDidAppear() {
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
    }
    
    var userSection: Int { 0 }
    
    func numberOfSection() -> Int {
        sut.tableView.numberOfRows(inSection: userSection)
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
        let dataSource = sut.tableView.dataSource
        let indexPath = IndexPath(row: row, section: userSection)
        let cell = dataSource?.tableView(sut.tableView, cellForRowAt: indexPath) as? TrendingRepositoryTableViewCell
        return cell?.viewModel
    }
}

class AppRouterStub: AppRouter {
    
    var isOpenCalled = false
    override func open(description: String) {
        isOpenCalled = true
    }
}
