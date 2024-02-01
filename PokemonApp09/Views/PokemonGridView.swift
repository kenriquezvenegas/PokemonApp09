//
//  PokemonGridView.swift
//  PokemonApp09
//
//  Created by Beatriz Enríquez on 01/02/24.
//

import SwiftUI

struct PokemonGridView: View {
    private let gridItems =  [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var pokemonVM = PokemonViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.green.opacity(0.2), Color.orange.opacity(0.7)]), startPoint: .top, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    LazyVGrid(columns: gridItems, spacing: 16){
                        ForEach(pokemonVM.pokemons){ pokemon in
                            NavigationLink{
                                PokemonDetailView(pokemon: pokemon, pokemonVM: pokemonVM)
                            } label: {
                                PokemonCell(pokemon: pokemon, pokemonVM: pokemonVM)
                            }
                            
                        }
                    }
                }
                .navigationTitle("Pokemon Club \(pokemonVM.pokemons.count)")
            }
        }
    }
}

#Preview {
    PokemonGridView()
}
