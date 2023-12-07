//
//  PokemonDetailView.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 28/08/23.
//

import SwiftUI

struct PokemonDetailView: View {
    var id: Int
    
    @ObservedObject var viewModel: PokemonDetailViewModel
    
    var body: some View {
        VStack {
            if let details = viewModel.pokemonDetails {
                makeContent(details: details)
            } else {
                Text("Loading...")
            }
        }
        .task {
            viewModel.loadDetail(id: id)
        }
    }
    
    @ViewBuilder
    func makeContent(details: PokemonDetails) ->  some View {
        AsyncImage(url: details.pokemon.imageURL) { image in
            image.image?.resizable()
        }
        .scaledToFit()
        
        Text(details.pokemon.name)
            .font(.title)
        
        HStack {
            Text("Height: \(details.height)")
                .font(.subheadline)
            Text("Weight: \(details.weight)")
                .font(.subheadline)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(id: 1, viewModel: .init(getPokemonDetailUseCase: DetailRepository.shared))
    }
}
