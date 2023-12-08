//
//  Constants.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct Constants {
    

    static let pokeApiPokemonListlimit: Int = 20
    
    enum APIEndpoint {
        case getPokemonList(limit: Int, offset: Int)
        case getPokemonDetails(id: Int)
        case getPokemonElements(id: Int)
        var path: String {
            switch self {
                case .getPokemonList(let limit, let offset):
                    "/pokemon?limit=\(limit)&offset=\(offset)"
                case .getPokemonDetails(let id):
                    "pokemon/\(id)/"
                case .getPokemonElements(let id):
                    "pokemon/\(id)/"
            }
        }
    }
}
