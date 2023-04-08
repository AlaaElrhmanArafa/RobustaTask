//
//  APIError.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

protocol APIServiceProtocol {
    func fetchRepos( complete: @escaping ( _ success: Bool, _ repos: [GitReposResponseElement], _ errorMessage: String? ) -> ())
}

class Service: APIServiceProtocol{
    func fetchRepos(complete: @escaping (Bool, [GitReposResponseElement], String?) -> ()) {
        DispatchQueue.global().async {
            APIRequest.shared.makeRequest(endpoint: .reposList) { (response: Result<[GitReposResponseElement], Error>) in
                switch response{
                case .success(let value):
                    complete(true, value, nil)
                case .failure(let error):
                    complete(false, [], error.localizedDescription)
                }
            }
        }
    }
}
