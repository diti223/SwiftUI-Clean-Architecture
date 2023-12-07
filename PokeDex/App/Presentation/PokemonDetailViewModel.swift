//
//  PokemonDetailViewModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 03/09/23.
//

import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    let getPokemonDetailUseCase: GetPokemonDetailUseCase
    @Published var pokemonDetail: PokemonDetailModel?
        
    init(getPokemonDetailUseCase: GetPokemonDetailUseCase) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }
    
    func loadDetail(id: Int) {
        Task {
            do {
                guard let pokemonDetailEntity: PokemonDetailEntity = try await getPokemonDetailUseCase.fetchPokemonDetail(id: id) else {
                    return
                }
                
                self.pokemonDetail = PokemonDetailModel(pokemonDetail: pokemonDetailEntity)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
