//
//  PokemonDetailView.swift
//  DicodingSwiftPemula
//
//  Created by Raden Dimas on 21/09/21.
//

import SwiftUI
import Kingfisher


struct PokemonDetailView: View {
    let pokemon: Pokemon
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = Color(viewModel.backgroundColor(forType: pokemon.type))
    }
    
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false){
            ZStack {
                VStack{
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .frame(maxWidth: 240, maxHeight: 320)
                        .padding(.top,100)
                        .padding(.bottom,10)
                       
                    
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 8)
                    
                    
                    Text(pokemon.type.capitalized)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding(.horizontal,24)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.init(.label).opacity(0.25))
                        )
                        .frame(width: 120, height: 24)
                    HStack{
                        VStack {
                            Text("Weight")
                                .fontWeight(.bold)
                            Text(String("\(pokemon.weight)"))
                                .font(.title)
                        }
                        .padding(.horizontal,24)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.init(.label).opacity(0.25))
                        )
                        VStack {
                            Text("Height")
                                .fontWeight(.bold)
                            Text(String(pokemon.height))
                                .font(.title)
                        }
                        .padding(.horizontal,24)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.init(.label).opacity(0.25))
                        )
                    }
                    .padding(.top,10)
                    .padding(.horizontal,5)
                    
                    Text("Description")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top,10)
                    
                    Text(pokemon.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .padding(.top,5)
                    
                    Text("Stats")
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.top,10)
                    
                    VStack(spacing: 5){
                        ForEach (0..<2) { i in
                            if( i == 0){
                                StatList(statusName: "atk", value: pokemon.attack/200, color: Color(.systemBackground))
                            }
                            else{
                                StatList(statusName: "def", value: pokemon.defense/200, color: Color(.systemBackground))
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(backgroundColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct StatList : View {
    @State var statusName : String
    @State var value : Float
    @State var color : Color
    var body: some View {
        HStack {
            Text(statusName.uppercased())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color(.systemBackground))
                .padding(.horizontal, 20)
            Text(String(Int(value*100))).foregroundColor(Color(.systemBackground))
            Meterbar(value: $value, color: $color).frame(height: 10)
                .padding(.trailing, 20)
        }
        .padding(.horizontal, 10)
    }
}

struct Meterbar : View {
    @Binding var value : Float
    @Binding var color : Color
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading){
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemFill))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                    .foregroundColor(color)
                    .animation(.linear)
                    .cornerRadius(45, corners: .allCorners)
            }
            .cornerRadius(45.0, corners: .allCorners)
        }
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}




