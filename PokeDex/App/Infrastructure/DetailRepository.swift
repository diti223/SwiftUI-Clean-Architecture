//
//  DetailRepository.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

class DetailRepository: GetPokemonDetailUseCase {
    static let shared = DetailRepository()
    
    private let detailDataSource = DetailDataSource()
    
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetails? {
        let pokemonDetailResponse: PokemonDetailReponseModel = try await detailDataSource.fetchPokemonDetail(id: id)
        
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
