//
//  Pokemon_Clean_ArchitectureApp.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

@main
struct PokeDexApp: App {
    let useCaseContainer = UseCaseContainer.makeAPI(httpClient: PokeAPIHTTPClient(session: .shared))
    
    var body: some Scene {
        WindowGroup {
            PokemonExploreView(
                viewModel: .init(getPokemonListUseCase: useCaseContainer.list), detailViewProvider: { pokemon in
                    PokemonDetailView(
                        id: pokemon.id,
                        viewModel: .init(getPokemonDetailUseCase: useCaseContainer.detail)
                    )
                }
            )
        }
    }
}


