//
//  SwiftUIView.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import SwiftUI
import Kingfisher

struct PokemonGrid: View {
    
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
   

    init(pokemon: Pokemon,viewModel: PokemonViewModel){
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(forType: pokemon.type))
        
    }
    
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top,8)
                    .padding(.leading)
                
                HStack{
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal,16)
                        .padding(.vertical,8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                        )
                        .frame(maxWidth: 256,maxHeight: 72)
                
                    KFImage(URL(string: pokemon.imageUrl))
                        .fade(duration: 0.35)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 144, maxHeight: 96)
                        .padding([.bottom,.trailing],4)
                }
                
            }
            
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(12.0)
        .shadow(color: backgroundColor, radius: 7, x: 0, y: 0)
    }
}

