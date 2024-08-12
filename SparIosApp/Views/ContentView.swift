//
//  ContentView.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isGrid: Bool = true
    
    var body: some View {
        ScrollView {
            SwitchViewBar(isGrid: $isGrid)
            if isGrid {
                GridView(products: ProductCardViewModel.mockProducts)
            } else {
                ListView(products: ProductCardViewModel.mockProducts)
            }
        }
    }
}

#Preview {
    ContentView()
}

#Preview ("Grid") {
    ScrollView {
        SwitchViewBar(isGrid: .constant(true))
        
        GridView(products: ProductCardViewModel.mockProducts)
    }
}

#Preview ("List") {
    ScrollView {
        SwitchViewBar(isGrid: .constant(false))
        ListView(products: ProductCardViewModel.mockProducts)
    }
}
