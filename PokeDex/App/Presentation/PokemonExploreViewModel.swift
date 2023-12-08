//
//  PokemonExploreViewModel.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

@MainActor
class PokemonExploreViewModel: ObservableObject {
    private let getPokemonListUseCase: GetPokemonListUseCase
    
    @Published var pokemons: [Pokemon] = []
    @Published var offset: Int = 20
    
    init(getPokemonListUseCase: GetPokemonListUseCase) {
        self.getPokemonListUseCase = getPokemonListUseCase
        self.pokemons = pokemons
        self.offset = offset
    }
    
    func handleOnAppear(pokemon: Pokemon) {
        guard pokemons.last == pokemon else { return }
        
        increaseOffset(value: 20)
        loadPokemonList()
    }
    
    func loadPokemonList() {
        Task {
            do {
                pokemons.append(contentsOf: try await getPokemonListUseCase.execute((limit: 20, offset: offset)))
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func increaseOffset(value: Int) {
        offset += value
    }
}
