//
//  Pokemon.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import Foundation



struct Pokemon:Identifiable, Decodable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Float
    let height: Float
    let description: String
    let attack: Float
    let defense: Float
    
}

