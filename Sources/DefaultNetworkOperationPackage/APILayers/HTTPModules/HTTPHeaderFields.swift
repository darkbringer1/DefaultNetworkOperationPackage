//
//  HTTPHeaderFields.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

enum HTTPHeaderFields {
    
    case contentType
    case contentNoUtf8
    var value: (String, String) {
        switch self {
            case .contentType:
                return ("Content-Type", "application/json; charset=utf-8")
            case .contentNoUtf8:
                return ("Content-Type", "application/json")
                
        }
    }

}
