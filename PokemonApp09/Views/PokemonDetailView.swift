//
//  PokemonDetailView.swift
//  PokemonApp09
//
//  Created by Beatriz Enríquez on 01/02/24.
//

import SwiftUI
import Kingfisher
let sampleNPoke = PokemonModel(id: 1, name: "test", imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", type: "fire", weight: 10, height: 10, attack: 10, defense: 10, description: "test another one")

let samplePokemonVM = PokemonViewModel()

struct PokemonDetailView: View {
    //objects of model and view model
    let pokemon: PokemonModel
    let pokemonVM: PokemonViewModel
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(pokemonVM.backgroundColor(forType: pokemon.type)).opacity(0.6), Color(pokemonVM.backgroundColor(forType: pokemon.type)).opacity(0.2)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
           
            VStack(alignment: .leading){
                VStack(alignment: .center){
                    Text(pokemon.name.capitalized)
                        .font(.largeTitle)
                        .font(.system(size: 40, weight: .bold, design: .rounded))
                        .foregroundStyle(Color(pokemonVM.backgroundColor(forType: pokemon.type)).opacity(0.5))
                    KFImage(URL(string: pokemon.imageUrl))
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(pokemonVM.backgroundColor(forType: pokemon.type)), radius: 5)
                        .frame(width: 250, height: 250)
                        .padding()
                        .padding(.leading, 20)
                    
                }
                HStack {
                    
                    //Pokemon Type
                    Text(pokemon.type.capitalized)
                        .font(.system(size: 16, weight: .medium, design: .serif))
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 14)
                                .fill(Color(pokemonVM.backgroundColor(forType: pokemon.type)).opacity(0.3))
                        )
                        .frame(width: 100, height: 24)
                }.padding(.leading)
                Text(pokemon.description)
                    .font(.system(size: 20, weight: .regular, design: .serif))
                RoundedRectangle(cornerRadius: 30)
                    .background(Color(pokemonVM.backgroundColor(forType: pokemon.type)).opacity(0.2))
                    .overlay(
                        VStack(alignment:.leading) {
                            
                            // created small view to avoid repeatation
                            Details(key: "Type :", value: pokemon.type.capitalized, image: "cloud.sun.bolt.fill")
                            Details(key: "Height :", value: "\(pokemon.height)", image: "staroflife.circle.fill")
                            Details(key: "Weight :", value: "\(pokemon.weight) ", image: "sparkles" )
                            Details(key: "Attack :", value: "\(pokemon.attack)", image: "tropicalstorm")
                            Details(key: "Defense :", value: "\(pokemon.defense)", image: "bonjour")
                        }.foregroundStyle(.white)
                    )
            }.frame(width: 330, height: 650, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .shadow(color: .black.opacity(0.3), radius: 8, x: 8, y: 8)
        }.navigationTitle("")
    }
}

#Preview {
    PokemonDetailView(pokemon: sampleNPoke, pokemonVM: samplePokemonVM)
}
