//
//  PokeAPIHTTPClient.swift
//  PokeDex
//
//  Created by Adrian Bilescu on 08.12.2023.
//

import Foundation

struct PokeAPIHTTPClient: HTTPClient {
    static let baseURL: URL = URL(string: "https://pokeapi.co/api/v2/")!
    static let timeout: Double = 15.0
    let session: URLSession
    
    init(session: URLSession) {
        self.session = session
    }
    
    func request(path: String) async throws -> HTTPResponse {
        try await URLSessionHTTPClient(
            baseURL: Self.baseURL,
            session: session,
            timeout: Self.timeout
        ).request(path: path)
    }
}
