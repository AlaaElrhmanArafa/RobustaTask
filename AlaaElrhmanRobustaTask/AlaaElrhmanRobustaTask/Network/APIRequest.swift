//
//  APIService.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

class APIRequest{
    static let shared = APIRequest()
    
    func makeRequest<T: Codable>(endpoint: Endpoints, completion: @escaping(Result<T, Error>) -> Void){
        guard Reachability.isConnectedToNetwork() else {
            completion(.failure(APIError.noConnection))
            return
        }
        
        guard let url = URL(string: endpoint.url) else {
            completion(.failure(APIError.notfount))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.httpMethod
        
        URLSession.shared.dataTask(with: request) { data, urlResponse, error in
            if let error = error{
                completion(.failure(error))
                return
            }
            
            guard let data = data else{
                completion(.failure(APIError.noData))
                return
            }
            
            do{
                let response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            }catch let error{
                completion(.failure(error))
            }
        }.resume()
    }
}
