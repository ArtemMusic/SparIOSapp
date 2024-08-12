//
//  ProductCardViewModel.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftData

final class ProductCardViewModel {    
    static let mockProducts = [
        ProductCard(title: "Сыр Ламбер 500/0 230г", currentPrice: 99.90, oldPrice: 199.0,
                    imageName: "Image-0", rating: 4.1, reviews: 18,
                    isFavorite: true, country: "Франция 🇫🇷", tag: .novinki, sale: 25),
        ProductCard(title: "Энергетический Напиток", currentPrice: 95699.90, oldPrice: 299.0,
                    imageName: "Image-1", rating: 4.2, reviews: 18,
                    isFavorite: false, country: nil, tag: nil, sale: 52),
        ProductCard(title: "Салат Овощной с Крабовыми Палочками", currentPrice: 250.90, oldPrice: 1199.0,
                    imageName: "Image-2", rating: 3.4, reviews: 18,
                    isFavorite: true, country: "Франция 🇫🇷", tag: nil, sale: 11),
        ProductCard(title: "Дорадо Охлажденная Непотрошеная 300-400г", currentPrice: 99.90, oldPrice: 199.0,
                    imageName: "Image-3", rating: 2.0, reviews: 18,
                    isFavorite: false, country: nil, tag: nil, sale: nil),
        ProductCard(title: "Ролл Маленькая Япония 216г", currentPrice: 367.90, oldPrice: 699.0,
                    imageName: "Image-4", rating: 5.0, reviews: 18,
                    isFavorite: true, country: nil, tag: .priceHit, sale: nil),
        ProductCard(title: "Огурцы тепличные cадово-огородные", currentPrice: 99.90, oldPrice: 199.0,
                    imageName: "Image-5", rating: 3.2, reviews: 18,
                    isFavorite: true, country: "Франция 🇫🇷", tag: nil, sale: nil),
        ProductCard(title: "Манго Кео", currentPrice: 49.90, oldPrice: 499.0, 
                    imageName: "Image-6", rating: 4.1, reviews: 18,
                    isFavorite: false, country: nil, tag: nil, sale: 12),
        ProductCard(title: "Салат Овощной с Крабовыми Палочками", currentPrice: 299.90, oldPrice: 1299.0,
                    imageName: "Image-7", rating: 1.4, reviews: 18,
                    isFavorite: false, country: nil, tag: nil, sale: 90),
        ProductCard(title: "Салат Овощной с Крабовыми Палочками", currentPrice: 929.90, oldPrice: 1399.0,
                    imageName: "Image-8", rating: 3.4, reviews: 18,
                    isFavorite: true, country: nil, tag: .ProductCardPrice, sale: 24),
        ProductCard(title: "Масло Слобода Рафинированное 1,8л", currentPrice: 919.90, oldPrice: 699.0,
                    imageName: "Image-9", rating: 2.2, reviews: 18,
                    isFavorite: false, country: nil, tag: nil, sale: 12),
        ProductCard(title: "Салат Овощной с Крабовыми Палочками", currentPrice: 929.90, oldPrice: 1299.0,
                    imageName: "Image-10", rating: 4.1, reviews: 18,
                    isFavorite: true, country: "Франция 🇫🇷", tag: nil, sale: 15),
        ProductCard(title: "Макаронные Изделия SPAR Спагетти 450г", currentPrice: 2699.90, oldPrice: 199.0,
                    imageName: "Image-11", rating: 1.5, reviews: 18,
                    isFavorite: false, country: nil, tag: .novinki, sale: nil),
        ProductCard(title: "Огурцы тепличные cадово-огородные", currentPrice: 19.90, oldPrice: 14.0,
                    imageName: "Image-12", rating: 4.1, reviews: 18,
                    isFavorite: false,  country: "Франция 🇫🇷", tag: nil, sale: nil),
        ProductCard(title: "Огурцы тепличные cадово-огородные", currentPrice: 192.90, oldPrice: 142.0,
                    imageName: "Image-13", rating: 2.9, reviews: 18,
                    isFavorite: true, country: "Франция 🇫🇷", tag: .priceHit, sale: nil),
    ]
}
