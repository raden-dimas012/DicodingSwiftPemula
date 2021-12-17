//
//  PokedexView.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())]
    
    @ObservedObject var viewModel = PokemonViewModel()
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemon){ pokemon in
                        NavigationLink(
                            destination: PokemonDetailView(pokemon: pokemon, viewModel: viewModel)){
                            PokemonGrid(pokemon: pokemon, viewModel: viewModel)
                        }
                    }
                }
            }
            .navigationTitle("Pokedex")
            .padding(8)
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
