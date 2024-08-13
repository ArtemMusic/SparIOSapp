//
//  BottomSection.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

// TitleAndCountrySection constants
var mainframeSize: CGSize = CGSize(width: 168, height: 110)
var priceAndBasketFrameSize: CGSize = CGSize(width: 168, height: 44)

struct BottomSection: View {
    var card: ProductCard
    @State private var addToCard: Bool = false
    
    var body: some View {
        ZStack {
            TitleAndCountrySection(card: card, isExpanded: addToCard)
            PriceAndBasketSection(addToCard: $addToCard, card: card)
        }
        .frame(width:mainframeSize.width, height:mainframeSize.height)
        .background(Color.white)
    }
}

struct TitleAndCountrySection: View {
    var card: ProductCard
    var isExpanded: Bool
    
    private let titleTextSize: CGFloat = 12
    private let countryTextSize: CGFloat = 12
    private let titlePadding: EdgeInsets = EdgeInsets(top: 8, leading: 8, bottom: 4, trailing: 8)
    private let titlePaddingExpanded: EdgeInsets = EdgeInsets(top:0, leading: 8, bottom: 0, trailing: 8)
    private let countryPaddingExpanded: EdgeInsets = EdgeInsets(top:0, leading: 8, bottom: 0, trailing: 8)
    private let countryPadding: EdgeInsets = EdgeInsets(top: 24, leading: 0, bottom: 0, trailing: 0)
    
    var body: some View {
        Text(card.title)
            .font(.system(size: titleTextSize, weight: .regular))
            .padding(isExpanded ? titlePaddingExpanded : titlePadding)
            .frame(width: mainframeSize.width, height: mainframeSize.height, alignment: .topLeading)
            .foregroundColor(.mainCard)
            .opacity(0.8)
        
        HStack(spacing: 0) {
            if let country = card.country, !country.isEmpty {
                let lastCharacter = country.last
                let stringWithOutLast = country.dropLast(2)
                
                Text(String(stringWithOutLast))
                    .opacity(0.6)
                
                Text(String(lastCharacter ?? " "))
            }
        }
        .font(.system(size: countryTextSize, weight: .regular))
        .padding(titlePadding)
        .padding(.top, 32)
        .frame(width: mainframeSize.width, height: mainframeSize.height, alignment: .topLeading)
    }
}

struct PriceAndBasketSection: View {
    @Binding var addToCard: Bool
    @State private var isButtonLocked = false
    
    @State var countKg: Float = 0.1
    @State var countInt: Int = 1
    @State var coastCount: Float = 0.0
    
    var card: ProductCard
    
    private let priceMainFontSize: CGFloat = 20
    private let priceFractionFontSize: CGFloat = 16
    private let oldPriceFontSize: CGFloat = 12
    private let priceMaxWidth: CGFloat = 66
    private let priceMaxHeight: CGFloat = 22
    private let mainPriceMaxWidth: CGFloat = 104
    private let mainPriceMaxHeight: CGFloat = 36
    private let fractionMaxWidth: CGFloat = 50
    private let fractionMaxHeight: CGFloat = 22
    private let oldPriceMaxWidth: CGFloat = 78
    private let oldPriceMaxHeight: CGFloat = 22
    private let pricePaddingLeading: CGFloat = 2
    private let imagePriceSize: CGFloat = 20
    private let pricePadding: EdgeInsets = EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 4)
    private let basketPadding: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 4)
    private let basketPaddingAdded: EdgeInsets = EdgeInsets(top: 0, leading: 4, bottom: 4, trailing: 4)
    private let basketRectangleCornerRadius: CGFloat = 40
    private let basketRectangleFrameSize: CGSize = CGSize(width: 48, height: 36)
    private let basketIconFrame: CGFloat = 16
    private let plusMinusIconFrame: CGFloat = 14
    
    @State private var isKg: Bool = true
    
    var body: some View {
        ZStack {
            ZStack {
                let priceParts = String(format: "%.2f", card.currentPrice).split(separator: ".")
                
                // Price
                VStack (alignment: .leading) {
                    HStack (alignment: .top, spacing: 0){
                        // First price part
                        Text(priceParts[0])
                            .font(.system(size: priceMainFontSize, weight: .bold))
                            .frame(maxWidth: priceMaxWidth, maxHeight: priceMaxHeight)
                            .fixedSize(horizontal: true, vertical: false)
                            .foregroundColor(.mainCard)
                        
                        // Second price part
                        Text(priceParts[1])
                            .font(.system(size: priceFractionFontSize, weight: .bold))
                            .frame(maxWidth: fractionMaxWidth, maxHeight: fractionMaxHeight, alignment: .top)
                            .fixedSize(horizontal: true, vertical: false)
                            .foregroundColor(.mainCard)
                            .padding(.leading, pricePaddingLeading)
                        
                        // Rubles on kilogram
                        Image("RublesOnKilogram")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imagePriceSize, height: imagePriceSize)
                    }
                    
                    ZStack {}
                    
                    // Old price
                    Text(String(format: "%.2f", card.oldPrice))
                        .frame(maxWidth: oldPriceMaxWidth, maxHeight: oldPriceMaxHeight)
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: oldPriceFontSize))
                        .strikethrough()
                        .foregroundColor(.mainCard)
                        .opacity(0.6)
                }
                .frame(maxWidth: mainPriceMaxWidth, maxHeight: mainPriceMaxHeight, alignment: .topLeading)
                .padding(pricePadding)
            }
            .frame(width: priceAndBasketFrameSize.width, height: priceAndBasketFrameSize.height, alignment: .topLeading)
            
            //Basket
            ZStack {
                if !addToCard {
                    ZStack {
                        Button(action: {
                            if !isButtonLocked {
                                addToCard.toggle()
                                isButtonLocked = true
                            }
                            updateCoastCount()
                        }) {
                            ZStack{
                                RoundedRectangle(cornerRadius: basketRectangleCornerRadius)
                                    .frame(width: basketRectangleFrameSize.width, height: basketRectangleFrameSize.height)
                                    .foregroundColor(.basketBackground)
                                
                                Image("BasketIcon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: basketIconFrame)
                            }
                        }
                        .padding(basketPadding)
                        .frame(width: priceAndBasketFrameSize.width, height: priceAndBasketFrameSize.height, alignment: .bottomTrailing)
                    }
                } else {
                    VStack {
                        ZStack {
                            Picker("Kg or Count?", selection: $isKg) {
                                Text("Кг").tag(true)
                                Text("Шт").tag(false)
                            }
                            .pickerStyle(.segmented)
                            .frame(width: .infinity, height: 25, alignment: .top)
                            .padding(.horizontal, 5)
                            .onChange(of: isKg) {
                                countKg = 0.1
                                countInt = 1
                                coastCount = 0.0
                                updateCoastCount()
                            }
                        }
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: basketRectangleCornerRadius)
                                .frame(width: .infinity, height: basketRectangleFrameSize.height)
                                .foregroundColor(.basketBackground)
                            HStack{
                                // Кнопка "минус"
                                Button(action: {
                                    if isKg {
                                        if countKg > 0.1 + .ulpOfOne{
                                            countKg = countKg - 0.1
                                            coastCount = card.currentPrice * countKg
                                        } else {
                                            addToCard = false
                                            isButtonLocked = false // разблокируем кнопку
                                        }
                                    }
                                    else {
                                        if countInt > 1 {
                                            countInt = countInt - 1
                                            coastCount = card.currentPrice * Float(countInt)
                                        } else {
                                            addToCard = false
                                            isButtonLocked = false // разблокируем кнопку
                                        }
                                        
                                    }
                                    updateCoastCount()
                                    
                                }) {
                                    ZStack{
                                        Image("Minus")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: plusMinusIconFrame)
                                    }
                                    .frame(height: basketRectangleFrameSize.height)
                                }
                                Spacer()
                                
                                ZStack{
                                    if isKg {
                                        Text(String(format: "%.1f кг", countKg))
                                        
                                            .font(.system(size: 16, weight: .bold))
                                            .padding(.top, 5)
                                            .frame(height: priceAndBasketFrameSize.height, alignment: .top)
                                        
                                        
                                        Text(String(format: "%.2f ₽", coastCount))
                                            .padding(.bottom, 5)
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(height: priceAndBasketFrameSize.height, alignment: .bottom)
                                    } else {
                                        Text(String("\(countInt) шт"))
                                        
                                            .font(.system(size: 16, weight: .bold))
                                            .padding(.top, 5)
                                            .frame(height: priceAndBasketFrameSize.height, alignment: .top)
                                        
                                        
                                        Text(String("\(coastCount) ₽"))
                                            .padding(.bottom, 5)
                                            .font(.system(size: 12, weight: .regular))
                                            .frame(height: priceAndBasketFrameSize.height, alignment: .bottom)
                                    }
                                    
                                    
                                }
                                .foregroundColor(.white)
                                Spacer()
                                
                                Button (action:{
                                    if isKg {
                                        countKg = countKg + 0.1
                                        coastCount = card.currentPrice * countKg
                                    } else {
                                        countInt = countInt + 1
                                        coastCount = card.currentPrice * Float(countInt)
                                    }
                                    
                                    updateCoastCount()
                                }) {
                                    
                                    Image("Plus")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: plusMinusIconFrame)
                                    
                                    
                                }
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal, 4)
                        .frame(width: priceAndBasketFrameSize.width, height: priceAndBasketFrameSize.height, alignment: .bottomTrailing)
                    }
                    .background(.white)
                }
            }
        }
        .frame(width: mainframeSize.width, height: mainframeSize.height, alignment: .bottom)
    }
    
    // Функция обновления цены в зависимости от выбора "кг" или "шт"
    private func updateCoastCount() {
        if isKg {
            coastCount = card.currentPrice * countKg
        } else {
            coastCount = card.currentPrice * Float(countInt)
        }
    }
}


