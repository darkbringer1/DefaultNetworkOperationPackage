//
//  APIManagerInterface.swift
//
//
//  Created by Doğukaan Kılıçarslan on 21.10.2022.
//

import Foundation

public protocol APIManagerInterface {
    func executeRequest<R: Codable>(urlRequest: URLRequest, completion: @escaping (Result<R, ErrorResponse>) -> Void)
    func executeAsyncRequest<R: Codable>(urlRequest: URLRequest) async throws -> R
}
