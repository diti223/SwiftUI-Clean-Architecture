//
//  UseCaseContainer.swift
//  PokeDex
//
//  Created by Adrian Bilescu on 08.12.2023.
//

import Foundation

extension UseCaseContainer {
    static func makeAPI(httpClient: HTTPClient) -> UseCaseContainer {
        UseCaseContainer(
            list: APIGetPokemonListUseCase(httpClient: httpClient).make(),
            detail: APIGetPokemonDetailUseCase(httpClient: httpClient).make()
        )
    }
}
