//
//  ListView.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct ListView: View {
    let products: [ProductCard]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(products) { product in
                ItemProductCardList(card: product)
            }
        }
        .frame(width: 375)
    }
}
