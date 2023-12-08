//
//  DetailRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

struct DetailRepository: GetPokemonDetailUseCase {
    let network: NetworkUtils
    
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetails? {
        guard let url: URL = Constants.APIEndpoint.getPokemonDetails(id: id).url else {
            throw URLError(.badURL)
        }
        let pokemonDetailResponse: PokemonDetailReponseModel = try await network.fetch(from: url)
        
        guard let pokemonDetail: PokemonDetails = PokemonDetails(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        return pokemonDetail
    }
}


extension PokemonDetails {
    init?(pokemonDetailResponse: PokemonDetailReponseModel) {
        guard let pokemon = Pokemon(pokemonDetailResponse: pokemonDetailResponse) else {
            return nil
        }
        
        self.pokemon = pokemon
        self.height = pokemonDetailResponse.height
        self.weight = pokemonDetailResponse.weight
    }
}
