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
    @Published var pokemonDetails: PokemonDetails?
        
    init(getPokemonDetailUseCase: GetPokemonDetailUseCase) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }
    
    func loadDetail(id: Int) {
        Task {
            do {
                self.pokemonDetails = try await getPokemonDetailUseCase.execute(id)
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
