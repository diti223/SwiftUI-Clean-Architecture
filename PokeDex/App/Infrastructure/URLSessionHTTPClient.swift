//
//  URLSessionHTTPClient.swift
//  PokeDex
//
//  Created by Adrian Bilescu on 08.12.2023.
//

import Foundation


struct URLSessionHTTPClient: HTTPClient {
    let session: URLSession
    let timeout: TimeInterval
    
    func request(url: URL) async throws -> HTTPResponse {
        let request = URLRequest(url: url)
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        return HTTPResponse(body: data, statusCode: httpResponse.statusCode)
    }
    
}
