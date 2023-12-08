//
//  Pokemon.swift
//  PokeDex
//
//  Created by Muhammad Adha Fajri Jonison on 31/08/23.
//

import Foundation

struct Pokemon: Hashable {
    typealias ID = Int
    let id: ID
    let name: String
    var imageURL: URL?
}
