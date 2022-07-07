//
//  RepositoryDesciptionViewControllerTests.swift
//  TakeHomeExerciseTests
//
//  Created by Ayesha on 06/07/2022.
//

import XCTest
@testable import TakeHomeExercise

class RepositoryDesciptionViewControllerTests: XCTestCase {
    
    private var sut: RepositoryDescriptionViewController!
    private var viewModelStub: RepositoryDescriptionViewModelStub!

    override func setUpWithError() throws {
    
        viewModelStub = RepositoryDescriptionViewModelStub()
        sut = RepositoryDescriptionViewController(viewModel: viewModelStub)
    }

    override func tearDownWithError() throws {
        
        viewModelStub = nil
        sut = nil
    }
    
    
    func test_nibFile_exist() {
        let expectedValue = "RepositoryDescriptionViewController"
        XCTAssertEqual(expectedValue, sut.nibName)
    }
    
    func test_viewModel_getRepositoryDescription() {
        let expectedValue = "abcd testing"
        XCTAssertEqual(expectedValue, viewModelStub.getRepositoryDescription())
    }
    
    func test_isViewModelInitialize(){
        XCTAssertNotNil(sut.viewModel)
    }
    
    func test_viewDidAppear_fetchRepositoryDetail() {
        sut.viewDidAppear(true)
        XCTAssertTrue(viewModelStub.fetchDetail)
    }
    

}


class RepositoryDescriptionViewModelStub: RepositoryDescriptionViewModelType {
    
    var fetchDetail: Bool = false
    
    func getRepositoryDescription() -> String {
        fetchDetail = true
        return "abcd testing"
    }
}
