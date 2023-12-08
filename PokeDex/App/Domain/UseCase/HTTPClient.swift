//
//  NetworkUtils.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

protocol HTTPClient {
    func request(path: String) async throws -> HTTPResponse
}

struct HTTPResponse {
    let body: Data
    let statusCode: Int
}
