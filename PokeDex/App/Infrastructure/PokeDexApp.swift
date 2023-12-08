//
//  Pokemon_Clean_ArchitectureApp.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

@main
struct PokeDexApp: App {
    let httpClient = PokeAPIHTTPClient(session: .shared)
    var body: some Scene {
        WindowGroup {
            PokemonExploreView(
                viewModel: .init(getPokemonListUseCase: APIGetPokemonListUseCase(network: httpClient)), detailViewProvider: { pokemon in
                    PokemonDetailView(
                        id: pokemon.id,
                        viewModel: .init(getPokemonDetailUseCase: APIGetPokemonDetailUseCase(network: httpClient))
                    )
                }
            )
        }
    }
}
