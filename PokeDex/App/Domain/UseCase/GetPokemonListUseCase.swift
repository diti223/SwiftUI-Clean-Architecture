//
//  FetchPokemonsUseCase.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import Foundation

typealias PageRequest = (limit: Int, offset: Int)
typealias GetPokemonListUseCase = AsyncUseCase<PageRequest, [Pokemon]>
