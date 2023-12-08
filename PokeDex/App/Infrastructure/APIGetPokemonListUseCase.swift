//
//  PokeDexDataSource.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct APIGetPokemonListUseCase: GetPokemonListUseCase {
    let network: HTTPClient
    let endpoint: Constants.APIEndpoint
    
    private func fetch(limit: Int, offset: Int) async throws -> APIPokemonListResponse {
        guard let url: URL = endpoint.url else {
            throw URLError(.badURL)
        }
        
        return try await network.fetch(from: url)
    }
    
    func fetchPokemons(limit: Int, offset: Int) async throws -> [Pokemon] {
        try await fetch(limit: limit, offset: offset).results.compactMap { response in
            Pokemon(pokemonResponse: response)
        }
    }
}




extension Pokemon {
    init?(pokemonResponse: APIPokemonListResponse.Result) {
        guard let urlComponents = URLComponents(string: pokemonResponse.url),
              let idString = urlComponents.path.split(separator: "/").last,
              let id = Int(idString) else {
            return nil
        }
        
        self.id = id
        self.name = pokemonResponse.name
        self.imageURL = Constants.APIEndpoint.getPokemonImage(id: id).url
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
