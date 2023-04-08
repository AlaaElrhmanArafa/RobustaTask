//
//  RepoViewModelTests.swift
//  AlaaElrhmanRobustaTaskTests
//
//  Created by AlaaElrhman on 08/04/2023.
//

import XCTest

final class RepoViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func test_parsing() throws{
        let model = RepoMocModel(date: "", desc: "Test parsing Desc", repoName: "Test parsing", owner: OwnerMoc(authorName: "Owner name", avatar: "", accountType: "User"))
        
        let viewModel = MocRepoViewModel(repo: model)
        
        XCTAssertEqual(model.desc, viewModel.desc)
        XCTAssertEqual(model.repoName, viewModel.repoName)
        XCTAssertEqual(model.date, viewModel.date)
        XCTAssertEqual(model.date, viewModel.date)
        XCTAssertEqual(model.owner?.avatar, viewModel.avatar)
        XCTAssertEqual(model.owner?.authorName, viewModel.authorName)
        XCTAssertEqual(model.owner?.accountType, viewModel.accountType)
    }
    

}
