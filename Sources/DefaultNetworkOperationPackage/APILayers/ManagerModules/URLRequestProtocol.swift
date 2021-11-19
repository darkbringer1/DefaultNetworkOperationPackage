//
//  URLRequestProtocol.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

protocol URLRequestProtocol {
    
    func returnUrlRequest(headerType: HTTPHeaderFields) throws -> URLRequest
}
