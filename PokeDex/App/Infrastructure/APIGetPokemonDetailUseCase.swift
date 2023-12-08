//
//  DetailRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

struct APIGetPokemonDetailUseCase: GetPokemonDetailUseCase {
    let network: HTTPClient
    
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetails? {
//        guard let url: URL = Constants.APIEndpoint.getPokemonDetails(id: id).url else {
//            throw URLError(.badURL)
//        }
//        
//        return try await NetworkUtils.shared.fetch(from: url)
        let response: APIGetPokemonDetailResponse = try await network.fetch(from: "pokemon/\(id)/")
        
        guard let pokemonDetail: PokemonDetails = PokemonDetails(response: response) else {
            return nil
        }
        
        return pokemonDetail
    }
}


extension PokemonDetails {
    init?(response: APIGetPokemonDetailResponse) {
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
