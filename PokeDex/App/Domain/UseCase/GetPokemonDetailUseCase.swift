//
//  GetPokemonDetailUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 29/08/23.
//

import Foundation

protocol GetPokemonDetailUseCase {
    func fetchPokemonDetail(id: Int) async throws -> PokemonDetails?
}
