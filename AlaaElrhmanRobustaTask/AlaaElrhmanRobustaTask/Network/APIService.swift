//
//  APIError.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRepos( complete: @escaping ( _ success: Bool, _ repos: [GitReposResponseElement], _ error: APIError? ) -> ())
}

class Service: APIServiceProtocol{
    func fetchRepos(complete: @escaping (Bool, [GitReposResponseElement], APIError?) -> ()) {
        DispatchQueue.global().async {
            APIRequest.shared.makeRequest(endpoint: .reposList) { (response: Result<[GitReposResponseElement], Error>) in
                
            }
        }
    }
}
