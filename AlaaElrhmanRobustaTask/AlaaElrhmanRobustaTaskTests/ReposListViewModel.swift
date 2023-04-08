//
//  ReposListViewModel.swift
//  AlaaElrhmanRobustaTaskTests
//
//  Created by AlaaElrhman on 08/04/2023.
//

import XCTest
@testable import AlaaElrhmanRobustaTask

final class ReposListViewModel: XCTestCase {

    var moc_NetworkService: APIServiceMocProtocol = APIServiceMoc()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        moc_NetworkService = APIServiceMoc()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_APIFailure() throws{
        moc_NetworkService.fetchReposFailure { success, repos, errorMsg in
            XCTAssertFalse(success)
            XCTAssertNotNil(errorMsg)
        }
    }
    
    func test_APISuccess() throws{
        moc_NetworkService.fetchReposSuccess { success, repos, errorMsg in
            XCTAssertTrue(success)
            XCTAssertNil(errorMsg)
            XCTAssertEqual(repos.count, mocRepos.count)
        }
    }
    
    func test_search() throws{
        let searchWord = "first"
        var cellViewModels: [MocRepoViewModel] = []
        
        
        let searchedRepos = mocRepos.filter({$0.repoName?.contains(searchWord) ?? false})
        cellViewModels = searchedRepos.map({return MocRepoViewModel(repo: $0)})
        
        XCTAssertEqual(cellViewModels.count, 1)
    }
    
    func test_clearSearch() throws{
        
        let cellViewModels = mocRepos.map({return MocRepoViewModel(repo: $0)})
        
        XCTAssertEqual(cellViewModels.count, mocRepos.count)
    }
}
