//
//  LeftSection.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//


import SwiftUI

struct LeftSection: View {
    var card: ProductCard
    private let mainFrame: CGSize = CGSize(width: 144, height: 144)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .resizable()
                .scaledToFill()
            
            if let tag = card.tag {
                Text(tag.rawValue)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 2, leading: 12, bottom: 4, trailing: 6))
                    .background(tag.color)
                    .clipShape(CustomRoundedShape(radius: 6, corners: [.topRight, .topLeft, .bottomRight]))
                    .frame(width: mainFrame.width, height: mainFrame.height, alignment: .topLeading)
            }
            
            if let sale = card.sale, sale > 0 {
                Text("\(sale)%")
                    .font(.system(size: 16, weight: .bold))
                    .opacity(0.8)
                    .padding(.trailing, 4)
                    .foregroundColor(.sale)
                    .frame(width: 42, height: 20)
                    .background(Color.white.opacity(0.8))
                    .clipShape(CustomRoundedShape(radius: 8, corners: [.topLeft, .topRight, .bottomRight]))
                    .frame(width: mainFrame.width, height: mainFrame.height, alignment: .bottomTrailing)
            }
        }
        .frame(width: mainFrame.width, height: mainFrame.height)
        .cornerRadius(8)
    }
}
