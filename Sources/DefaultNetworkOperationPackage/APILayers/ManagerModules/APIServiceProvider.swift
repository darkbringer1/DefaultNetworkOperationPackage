//
//  APIServiceProvider.swift
//  CartCodeCase
//
//  Created by Erkut Bas on 21.10.2020.
//

import Foundation

open class ApiServiceProvider<T: Codable>: URLRequestProtocol {

    private var method: HTTPMethod
    private var baseUrl: String
    private var path: String?
    private var data: T?
    
    public init(method: HTTPMethod = .get,
         baseUrl: String,
         path: String? = nil,
         data: T? = nil) {
        
        self.method = method
        self.baseUrl = baseUrl
        self.path = path
        self.data = data
    }
    
    public func returnUrlRequest(headerType header: HTTPHeaderFields) throws -> URLRequest {
        
        var url = try baseUrl.asURL()
        
        if let path = path {
            url = url.appendingPathComponent(path)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
//        request.headers = getHeaders(header: header)
        
        try configureEncoding(request: &request)
        
        return request
    }
    
    private func configureEncoding(request: inout URLRequest) throws {
        switch method {
        case .post, .put:
            try ParameterEncoding.jsonEncoding.encode(urlRequest: &request, parameters: params)
        case .get:
            try ParameterEncoding.urlEncoding.encode(urlRequest: &request, parameters: params)
        default:
            try ParameterEncoding.urlEncoding.encode(urlRequest: &request, parameters: params)
        }
    }
    
    private var params: Parameters? {
        return data.asDictionary()
    }
    
//    private func getHeaders(header: HTTPHeaderFields) -> HTTPHeaders {
//        var httpHeaders = HTTPHeaders()
//        httpHeaders.add(HTTPHeader(name: header.value.0, value: header.value.1))
//        return httpHeaders
//    }
    
    
}
