//
//  DetailView.swift
//  PokemonApp09
//
//  Created by Beatriz Enríquez on 01/02/24.
//

import Foundation
import SwiftUI

struct Details: View {
    let key: String
    let value: String
    let image: String
    
    var body: some View {
        HStack(spacing: 10 ) {
            Image(systemName: image)
                .font(.system(size: 18, weight: .semibold, design: .serif))
            Text(key)
                .font(.system(size: 18, weight: .semibold, design: .serif))
            Text(value)
                .font(.system(size: 16, weight: .semibold, design: .serif))
        }
    }
}
