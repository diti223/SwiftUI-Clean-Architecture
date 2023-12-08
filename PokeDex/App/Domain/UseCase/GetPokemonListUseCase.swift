//
//  FetchPokemonsUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

protocol GetPokemonListUseCase {
    func fetchPokemons(limit: Int, offset: Int) async throws -> [Pokemon]
}
