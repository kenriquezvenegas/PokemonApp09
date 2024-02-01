//
//  PokemonModel.swift
//  PokemonApp09
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import Foundation

struct PokemonModel: Decodable, Identifiable {
    var id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Int
    let height: Int
    let attack: Int
    let defense: Int
    let description: String
    
}
