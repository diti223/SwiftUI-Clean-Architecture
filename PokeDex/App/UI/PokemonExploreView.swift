//
//  ContentView.swift
//  Pokemon Clean Architecture
//
//  Created by Muhammad Adha Fajri Jonison on 25/08/23.
//

import SwiftUI

struct PokemonExploreView<Detail: View>: View {
    @ObservedObject var viewModel: PokemonExploreViewModel
    @ViewBuilder var detailViewProvider: (Pokemon) -> Detail
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.pokemons, id: \.self) { pokemon in
                    NavigationLink(destination: {
                        detailViewProvider(pokemon)
                    }, label: {
                        PokemonListView(pokemon: pokemon)
                            .onAppear(perform: {
                                viewModel.handleOnAppear(pokemon: pokemon)
                            })
                    })
                }
            }
        }
        .task {
            viewModel.loadPokemonList()
        }
    }
}

struct PokemonExploreView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonExploreView(viewModel: .init(getPokemonListUseCase: ExploreRepository(exploreDataSource: ExploreDataSource())), detailViewProvider: { pokemon in
//            PokemonDetailView(id: pokemon.id, viewModel: .init(getPokemonDetailUseCase: DetailRepository(network: .shared)))
            EmptyView()
        })
    }
}
