//
//  Endpoints.swift
//  AlaaElrhmanRobustaTask
//
//  Created by AlaaElrhman on 08/04/2023.
//

import Foundation

struct API {
    static let baseUrl = "https://api.github.com/"
}

enum Endpoints {
   case reposList
    
    var path: String{
        switch self{
        case .reposList:
            return "repositories"
        }
    }
    
    var url: String{
        switch self{
        case .reposList:
            return "\(API.baseUrl)\(path)"
        }
    }
    
    var httpMethod: String{
        switch self{
        case .reposList:
            return "GET"
        }
    }
}


enum APIError: Error {
    case forbidden  // code 403
    case notfount   // code 404
    case conflict   // code 409
    case internalServerError    // code 500
    case noData
    case noConnection
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        if self ==  .noConnection{
            return "No Connection"
        }else if self == .notfount{
            return "Not Found"
        }else if self == .internalServerError{
            return "Sorry, an error happend, please try to connect later"
        }else if self == .noData{
            return "No Data Found."
        }
        return ""
    }
}
