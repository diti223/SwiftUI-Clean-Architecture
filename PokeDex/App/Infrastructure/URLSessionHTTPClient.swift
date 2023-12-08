//
//  URLSessionHTTPClient.swift
//  PokeDex
//
//  Created by Adrian Bilescu on 08.12.2023.
//

import Foundation


struct URLSessionHTTPClient: HTTPClient {
    let baseURL: URL
    let session: URLSession
    let timeout: TimeInterval
    
    func request(path: String) async throws -> HTTPResponse {
        let request = URLRequest(url: baseURL.appending(path: path))
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        return HTTPResponse(body: data, statusCode: httpResponse.statusCode)
    }
    
}
