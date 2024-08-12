//
//  GridView.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//


import SwiftUI

struct GridView: View {
    let products: [ProductCard]
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 0),
        GridItem(.flexible()),
    ]
    
    private let gridPadding: CGFloat = 20
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(products) { product in
                ItemProductCardGrid(card: product)
            }
        }
        .padding(.horizontal, gridPadding)
    }
}
