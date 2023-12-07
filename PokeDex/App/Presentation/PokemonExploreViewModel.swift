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
    
    @Published var pokemonList: [PokemonModel] = []
    @Published var offset: Int = 20
    
    init(getPokemonListUseCase: GetPokemonListUseCase) {
        self.getPokemonListUseCase = getPokemonListUseCase
        self.pokemonList = pokemonList
        self.offset = offset
    }
    
    func handleOnAppear(pokemon: PokemonModel) {
        guard pokemonList.last == pokemon else { return }
        
        increaseOffset(value: Constants.pokeApiPokemonListlimit)
        loadPokemonList()
    }
    
    func loadPokemonList() {
        Task {
            do {
                let pokemonEntityList = try await getPokemonListUseCase.execute(limit: 20, offset: offset)
                pokemonList += pokemonEntityList.compactMap({ pokemon in PokemonModel(pokemon: pokemon) })
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func increaseOffset(value: Int) {
        offset += value
    }
}
