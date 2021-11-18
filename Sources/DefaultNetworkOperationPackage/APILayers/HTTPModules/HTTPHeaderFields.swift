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
    
    var value: (String, String) {
        switch self {
            case .contentType:
                return ("Content-Type", "application/json")
            case .contentTypeUTF8:
                return ("Content-Type", "application/json; charset=utf-8")
        }
    }
    
}
