//
//  GetPokemonDetailUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 29/08/23.
//

import Foundation

typealias GetPokemonDetailUseCase = AsyncUseCase<Pokemon.ID, PokemonDetails?>
