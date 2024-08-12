//
//  ItemProductCardGrid.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//
import SwiftUI

struct ItemProductCardGrid: View {
    var card: ProductCard
    
    var body: some View {
        VStack(spacing: 0) {
            TopSection(card: card)
            BottomSection(card: card)
        }
        .clipShape(CustomRoundedShape(radius: 16, corners: [.topLeft, .topRight]))
        .clipShape(CustomRoundedShape(radius: 20, corners: [.bottomLeft, .bottomRight]))
        .shadow(color: Color("ShadowCard").opacity(0.2), radius: 8, x: 0, y: 0)
    }
}
