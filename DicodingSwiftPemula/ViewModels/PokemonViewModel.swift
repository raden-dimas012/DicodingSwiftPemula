//
//  PokemonViewModel.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject{
    
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    
    init() {
        fetchPokemon()
    }
    
    func fetchPokemon(){
        guard let url = URL(string: baseUrl) else { return }
        
        URLSession.shared.dataTask(with: url){ (data,response,error) in
            
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self,from: data) else {return}
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
    }
    
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGray
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "pychic": return .systemOrange
        case "normal": return .systemRed
        case "flying": return .systemTeal
        case "fairy": return .systemGreen
        default: return .systemIndigo
        }
        
    }
    
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        
        return data
    }
    
}

let myProfile = MyProfile.init(name: "Raden Dimas", birth: "Jambi,10-06-2000", email: "dimascode012@gmail.com", role: "iOS Developer", image: "myPhoto")
