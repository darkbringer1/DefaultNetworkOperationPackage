//
//  HTTPHeaderFields.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

public enum HTTPHeaderFields {
    
    case contentTypeUTF8
    case contentType
    case authorization(String)
    case rapidApi(String)
    case gzip

    var value: (String, String) {
        switch self {
        case .contentType:
            return ("Content-Type", "application/json")
        case .contentTypeUTF8:
            return ("Content-Type", "application/json; charset=utf-8")
        case .authorization(let auth):
            return ("X-VP-Authorization", auth)
        case .rapidApi(let key):
            return("x-rapidapi-key", key)
        case .gzip:
            return("Accept-Encoding", "gzip")
        }
    }
    
}
