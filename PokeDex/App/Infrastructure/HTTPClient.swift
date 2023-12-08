//
//  NetworkUtils.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct URLSessionHTTPClient: HTTPClient {
    let session: URLSession
    let timeout: TimeInterval
    
    func request(url: URL) async throws -> HTTPResponse {
        var request = URLRequest(url: url)
//        request.timeoutInterval = Constants.pokeApiTimeoutInterval
        
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        
        return HTTPResponse(body: data, statusCode: httpResponse.statusCode)
    }
    
//    func fetch<T: Codable>(from url: URL) async throws -> T {
//        var request = URLRequest(url: url)
//        request.timeoutInterval = Constants.pokeApiTimeoutInterval
//        
//        let (data, response) = try await session.data(for: request)
//        
//        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
//            throw URLError(.badServerResponse)
//        }
//        
//        let decodedData = try JSONDecoder().decode(T.self, from: data)
//        
//        return decodedData
//    }
}

protocol HTTPClient {
    func request(url: URL) async throws -> HTTPResponse
}

extension HTTPClient {
    func fetch<T: Decodable>(from url: URL) async throws -> JSONResponse<T> {
        let response = try await self.request(url: url)
        let json = JSONResponse(
            object: try JSONDecoder().decode(T.self, from: response.body),
            statusCode: response.statusCode
        )
        return json
    }
    
    func fetch<T: Decodable>(from url: URL) async throws -> T {
        try await self.fetch(from: url).object
    }
}

struct JSONResponse<T: Decodable> {
    let object: T
    let statusCode: Int
}

struct HTTPResponse {
    let body: Data
    let statusCode: Int
}
