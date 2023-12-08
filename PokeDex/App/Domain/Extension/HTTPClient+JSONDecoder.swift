//
//  HTTPClient+JSONDecoder.swift
//  PokeDex
//
//  Created by Adrian Bilescu on 08.12.2023.
//

import Foundation

extension HTTPClient {
    func fetch<T: Decodable>(from path: String) async throws -> JSONResponse<T> {
        let response = try await self.request(path: path)
        let json = JSONResponse(
            object: try JSONDecoder().decode(T.self, from: response.body),
            statusCode: response.statusCode
        )
        return json
    }
    
    func fetch<T: Decodable>(from path: String) async throws -> T {
        try await self.fetch(from: path).object
    }
}

struct JSONResponse<T: Decodable> {
    let object: T
    let statusCode: Int
}
