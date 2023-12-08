//
//  DetailRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

struct APIGetPokemonDetailUseCase {
    let httpClient: HTTPClient
    
    
    func make() -> GetPokemonDetailUseCase {
        .init { id in
            PokemonDetails(
                response: try await httpClient.fetch(from: "pokemon/\(id)/")
            )
        }
    }
}

extension PokemonDetails {
    init(response: APIGetPokemonDetailResponse) {
        self.init(
            pokemon: Pokemon(id: response.id, name: response.name),
            height: response.height,
            weight: response.weight
        )
    }
}

struct APIGetPokemonDetailResponse: Codable {
    let id: Int
    let name: String
    let height: Int
    let weight: Int
}
