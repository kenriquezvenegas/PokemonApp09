//
//  PokemonViewModel.swift
//  PokemonApp09
//
//  Created by Beatriz Enríquez on 31/01/24.
//

import Foundation
import SwiftUI

class PokemonViewModel: ObservableObject{
    @Published var pokemons = [PokemonModel]()
    
    let baseURL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init(){
        fetchData()
    }
    
    
    func fetchData(){
        guard let url = URL(string: baseURL) else {return}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            if let err = error {
                print(err)
            }
            //remove extra string and null from data
            guard let data = data?.parseData(removeString: "null,") else {return}
            guard let pokemon = try? JSONDecoder().decode([PokemonModel].self, from: data) else{return}
            
            DispatchQueue.main.async {
                self.pokemons = pokemon
            }
            
        }.resume()
    }
    
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .orange
        case "poison": return .purple
        case "water": return .blue
        case "electric": return .yellow
        case "psychic": return .brown
        case "normal": return .magenta
        case "ground": return .green
        case "flying": return .cyan
        case "fairy": return .systemTeal
        default: return .systemPink
        }
    }
}



// MARK: - An extesion Data to remove null item in pokemon list
extension Data {
    func parseData(removeString string: String) -> Data? {
        
        let dataAsString = String(data: self, encoding: .utf8)
        
        //replacing the occurance of unwanted string(sentances) with " "
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        //return data in the form of utf8 format
        guard let data = parsedDataString?.data(using: .utf8) else { return nil}
        print("Here is the data")
        print(data)
        return data
    }
}
