//
//  ProductCard.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct ProductCard: Identifiable {
    let id: UUID
    let title: String
    let currentPrice: Float
    let oldPrice: Float
    let imageName: String
    let rating: Float
    let reviews: Int8
    var isFavorite: Bool
    let country: String?
    let tag: Tag?
    let sale: Int8?

    init(id: UUID = UUID(), title: String, currentPrice: Float, 
         oldPrice: Float, imageName: String, rating: Float, reviews: Int8, isFavorite: Bool, country: String?,
         tag: Tag?, sale: Int8?) {
        self.id = id
        self.title = title
        self.currentPrice = currentPrice
        self.oldPrice = oldPrice
        self.imageName = imageName
        self.rating = rating
        self.reviews = reviews
        self.isFavorite = isFavorite
        self.country = country
        self.tag = tag
        self.sale = sale
    }

    enum Tag: String, Codable {
        case novinki = "Новинки"
        case ProductCardPrice = "Цена по карте"
        case priceHit = "Удар по ценам"

        var color: Color {
            switch self {
            case .novinki:
                return .novelty.opacity(0.9)
            case .ProductCardPrice:
                return .priceOnCard.opacity(0.9)
            case .priceHit:
                return .blowToPrices.opacity(0.9)
            }
        }
    }
}
