//
//  Pokemon_Clean_ArchitectureApp.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

@main
struct PokeDexApp: App {
    var body: some Scene {
        WindowGroup {
            PokemonExploreView(viewModel: .init(getPokemonListUseCase: .init(pokeDexRepository: ExploreRepository.shared))) { pokemon in
                PokemonDetailView(id: pokemon.id, viewModel: .init(getPokemonDetailUseCase: .init(repository: DetailRepository.shared)))
            }
        }
    }
}
