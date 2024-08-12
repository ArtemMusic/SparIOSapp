//
//  TopSection.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct TopSection: View {
    @State var card: ProductCard
    
    private let imageSize: CGFloat = 168
    private let iconFrame: CGFloat = 32
    private let orderIconSize: CGFloat = 16
    private let favoriteIconSize: CGFloat = 16
    private let starIconSize: CGFloat = 12
    private let tagTextSize: CGFloat = 10
    private let saleTextSize: CGFloat = 16
    private let cornerRadiusOrderAndFavorites: CGFloat = 16
    private let cornerRadiusTag: CGFloat = 6
    private let cornerRadiusSale: CGFloat = 8
    private let tagPadding: EdgeInsets = EdgeInsets(top: 2, leading: 12, bottom: 4, trailing: 6)
    private let salePadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4)
    private let iconStackSize: CGSize = CGSize(width: 32, height: 64)
    private let ratingViewSize: CGSize = CGSize(width: 42, height: 20)
    private let saleViewSize: CGSize = CGSize(width: 42, height: 20)
    
    var body: some View {
        ZStack {
            Image(card.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: imageSize, height: imageSize)
            
            OrderAndFavorite(card: card)
            TagView(tag: card.tag)
            RatingView(rating: card.rating)
            SaleView(sale: card.sale)
        }
        .frame(width: imageSize, height: imageSize)
    }
}

struct OrderAndFavorite: View {
    var card: ProductCard
    
    private let iconFrame: CGFloat = 32
    private let favoriteIconSize: CGFloat = 16
    private let cornerRadiusOrderAndFavorites: CGFloat = 16
    private let imageSize: CGFloat = 168
    private let cornerRaduis: CGFloat = 16
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Button(action: {}) {
                    Image(.order)
                        .resizable()
                        .scaledToFit()
                        .frame(width: favoriteIconSize)
                }
                .frame(width: iconFrame, height: iconFrame)
                
                Button(action: {}) {
                    Image(card.isFavorite ? .favoritesFill : .favorites)
                        .resizable()
                        .scaledToFit()
                        .frame(width: favoriteIconSize)
                }
                .frame(width: iconFrame, height: iconFrame)
            }
            .frame(width: iconFrame, height: iconFrame * 2)
            .background(Color.white.opacity(0.8))
            .clipShape(CustomRoundedShape(radius: cornerRaduis, corners: [.topRight, .bottomLeft]))
        }
        .frame(width: imageSize, height: imageSize, alignment: .topTrailing)
    }
}

struct TagView: View {
    var tag: ProductCard.Tag?
    
    private let tagTextSize: CGFloat = 10
    private let tagPadding: EdgeInsets = EdgeInsets(top: 2, leading: 12, bottom: 4, trailing: 6)
    private let cornerRadiusTag: CGFloat = 6
    private let imageSize: CGFloat = 168
    private let cornerRaduis: CGFloat = 6
    
    var body: some View {
        if let tag = tag {
            Text(tag.rawValue)
                .font(.system(size: tagTextSize, weight: .regular))
                .foregroundColor(.white)
                .padding(tagPadding)
                .background(tag.color)
                .clipShape(CustomRoundedShape(radius: cornerRaduis, corners: [.topRight, .bottomRight]))
                .frame(width: imageSize, height: imageSize, alignment: .topLeading)
        }
    }
}

struct RatingView: View {
    var rating: Float
    
    private let starIconSize: CGFloat = 12
    private let ratingViewSize: CGSize = CGSize(width: 42, height: 20)
    private let imageSize: CGSize = CGSize(width: 168, height: 168)
    private let tagCornerRadius: CGFloat = 4
    
    var body: some View {
        ZStack {
            HStack(spacing: 2) {
                Image(.star)
                    .resizable()
                    .scaledToFit()
                    .frame(width: starIconSize)
                
                Text("\(String(format: "%.1f", rating))")
                    .font(.system(size: starIconSize, weight: .regular))
                    .opacity(0.8)
            }
            .frame(width: ratingViewSize.width, height: ratingViewSize.height)
            .background(Color.white.opacity(0.8))
            .clipShape(CustomRoundedShape(radius: tagCornerRadius, corners: [.topRight]))
        }
        .frame(width: imageSize.width, height: imageSize.height, alignment: .bottomLeading)
    }
}

struct SaleView: View {
    var sale: Int8?
    
    private let saleTextSize: CGFloat = 16
    private let saleViewSize: CGSize = CGSize(width: 42, height: 20)
    private let salePadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 4)
    private let cornerRadiusSale: CGFloat = 8
    private let imageSize: CGSize = CGSize(width: 168, height: 168)
    
    var body: some View {
        if let sale = sale, sale > 0 {
            Text("\(sale)%")
                .font(.system(size: saleTextSize, weight: .bold))
                .opacity(0.8)
                .padding(salePadding)
                .foregroundColor(.sale)
                .frame(width: saleViewSize.width, height: saleViewSize.height)
                .background(Color.white.opacity(0.8))
                .clipShape(CustomRoundedShape(radius: cornerRadiusSale, corners: [.topLeft, .topRight, .bottomLeft]))
                .frame(width: imageSize.width, height: imageSize.height, alignment: .bottomTrailing)
        }
    }
}

