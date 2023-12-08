//
//  NetworkUtils.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

protocol HTTPClient {
    func request(url: URL) async throws -> HTTPResponse
}

struct HTTPResponse {
    let body: Data
    let statusCode: Int
}
