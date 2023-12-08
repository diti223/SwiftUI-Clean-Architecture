//
//  Pokemon_Clean_ArchitectureApp.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

@main
struct PokeDexApp: App {
    let network = URLSessionHTTPClient(session: .shared, timeout: 30)
    var body: some Scene {
        WindowGroup {
            PokemonExploreView(
                viewModel: .init(getPokemonListUseCase: APIGetPokemonListUseCase(network: network, endpoint: .getPokemonList(limit: 20, offset: 0))), detailViewProvider: { pokemon in
                    PokemonDetailView(
                        id: pokemon.id,
                        viewModel: .init(getPokemonDetailUseCase: APIGetPokemonDetailUseCase(network: network))
                    )
                }
            )
        }
    }
}
