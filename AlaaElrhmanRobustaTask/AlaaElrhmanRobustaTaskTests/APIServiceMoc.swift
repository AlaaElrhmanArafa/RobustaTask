//
//  APIServiceMoc.swift
//  AlaaElrhmanRobustaTaskTests
//
//  Created by AlaaElrhman on 08/04/2023.
//

import XCTest
@testable import AlaaElrhmanRobustaTask

protocol APIServiceMocProtocol {
    func fetchReposSuccess( complete: @escaping ( _ success: Bool, _ repos: [RepoMocModel], _ errorMessage: String? ) -> ())
    func fetchReposFailure( complete: @escaping ( _ success: Bool, _ repos: [RepoMocModel], _ errorMessage: String? ) -> ())
}

final class APIServiceMoc: XCTestCase {
    
    
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
    
    public func get(_ data: Data, completionHandler: @escaping (Result<Data?, Error>) -> Void) {
        completionHandler(.success(data))
    }
    
    public func getNoDataError(completionHandler: @escaping (Result<Data?, Error>) -> Void){
        completionHandler(.failure(APIError.noData))
    }
}
extension APIServiceMoc: APIServiceMocProtocol{
    func fetchReposSuccess(complete: @escaping (Bool, [RepoMocModel], String?) -> ()) {
        complete(true, mocRepos, nil)
    }
    
    func fetchReposFailure(complete: @escaping (Bool, [RepoMocModel], String?) -> ()) {
        complete(false, [], APIError.noData.localizedDescription)
    }
}
