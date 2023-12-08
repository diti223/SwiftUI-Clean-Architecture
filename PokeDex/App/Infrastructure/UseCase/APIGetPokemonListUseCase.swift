//
//  PokeDexDataSource.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct APIGetPokemonListUseCase  {
    let httpClient: HTTPClient
    
    private func fetch(limit: Int, offset: Int) async throws -> APIPokemonListResponse {
        return try await httpClient.fetch(from: "/pokemon?limit=\(limit)&offset=\(offset)")
    }
    
    func make() -> GetPokemonListUseCase {
        .init { request in
            let (limit, offset) = request
            return try await fetch(limit: limit, offset: offset).results.compactMap { response in
                Pokemon(pokemonResponse: response)
            }
        }
    }
}

extension Pokemon {
    private static let pokeApiArtworkURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%d.png"
    init?(pokemonResponse: APIPokemonListResponse.Result) {
        guard let urlComponents = URLComponents(string: pokemonResponse.url),
              let idString = urlComponents.path.split(separator: "/").last,
              let id = Int(idString) else {
            return nil
        }
        
        self.id = id
        self.name = pokemonResponse.name
        self.imageURL = URL(string: String(format: Self.pokeApiArtworkURL, id))!
    }
    
}

struct APIPokemonListResponse: Codable {
    struct Result: Codable {
        let name: String
        let url: String
    }
    let count: Int
    let next: String?
    let previous: String?
    let results: [Result]
}
