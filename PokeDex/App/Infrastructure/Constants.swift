//
//  Constants.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 27/08/23.
//

import Foundation

struct Constants {
    static let pokeApiArtworkURL: String = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/%d.png"
    

    static let pokeApiPokemonListlimit: Int = 20
    
    enum APIEndpoint {
        case getPokemonList(limit: Int, offset: Int)
        case getPokemonImage(id: Int)
        case getPokemonDetails(id: Int)
        case getPokemonElements(id: Int)
        var url: URL? {
            switch self {
                case .getPokemonList(let limit, let offset):
                    baseURL.appending(path: "/pokemon?limit=\(limit)&offset=\(offset)")
                case .getPokemonImage(let id):
                    baseURL.appending(path: String(format: pokeApiArtworkURL, id))
                case .getPokemonDetails(let id):
                    
                    baseURL.appending(path: "\(baseURL)pokemon/\(id)/")
                case .getPokemonElements(let id):
                    baseURL.appending(path: "\(baseURL)pokemon/\(id)/")
            }
        }
    }
}
