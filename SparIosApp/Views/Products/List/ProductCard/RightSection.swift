//
//  RightSection.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

var mainFrame: CGSize = CGSize(width: 199, height: 144)

struct RightSection: View {
    var card: ProductCard
    @State private var addToCard: Bool = false
    
    private let titleTextSize: CGFloat = 12
    private let countryTextSize: CGFloat = 12
    private let priceMainFontSize: CGFloat = 20
    private let priceFractionFontSize: CGFloat = 16
    private let oldPriceFontSize: CGFloat = 12
    private let priceMaxWidth: CGFloat = 66
    private let priceMaxHeight: CGFloat = 22
    private let fractionMaxWidth: CGFloat = 50
    private let fractionMaxHeight: CGFloat = 22
    private let oldPriceMaxWidth: CGFloat = 78
    private let oldPriceMaxHeight: CGFloat = 22
    private let pricePaddingLeading: CGFloat = 2
    private let titleFrameStack: [String : CGFloat] = ["width": 152, "height": 30]
    private let countryFrameStack: [String : CGFloat] = ["width": 152, "height": 152]
    
    var body: some View {
        ZStack {
            ZStack {
                VStack(spacing: 0) {
                    Button(action: {}) {
                        Image(.order)
                            .frame(width: 32)
                    }
                    .frame(width: 32, height: 32)
                    
                    Button(action: {}) {
                        Image(card.isFavorite ? .favoritesFill : .favorites)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16)
                    }
                    .frame(width: 32, height: 32)
                }
                .frame(width: 32, height: 64)
                .background(Color.white.opacity(0.8))
                .clipShape(CustomRoundedShape(radius: 16, corners: [.topRight, .bottomLeft]))
            }
            .frame(width: mainFrame.width, height: mainFrame.height, alignment: .topTrailing)
            
            VStack {
                HStack(spacing: 2) {
                    Image(.star)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12)
                    
                    Text("\(String(format: "%.1f", card.rating))")
                        .font(.system(size: 12, weight: .regular))
                        .opacity(0.8)
                    Divider()
                        .frame(height: 16)
                        
                    Text("\(card.reviews) отзывов")
                        .font(.system(size: 12, weight: .regular))
                        .opacity(0.6)
                }
                .background(Color.white.opacity(0.8))
                .frame(width: mainFrame.width, alignment: .leading)
                
                
                HStack {
                    Text(card.title)
                        .font(.system(size: titleTextSize, weight: .regular))
                        .foregroundColor(.mainCard)
                        .opacity(0.8)
                }
                .frame(width: mainFrame.width, alignment: .leading)
                
                HStack(spacing: 0) {
                    if let country = card.country, !country.isEmpty {
                        let lastCharacter = country.last
                        let stringWithOutLast = country.dropLast(2)
                        
                        Text(String(stringWithOutLast))
                            .opacity(0.6)
                        
                        Text(String(lastCharacter ?? " "))
                    }
                }
                .padding(.top, 4)
                .font(.system(size: countryTextSize, weight: .regular))
                .frame(width: mainFrame.width, alignment: .leading)
            }
            .padding(4)
            .frame(width: mainFrame.width, height: mainFrame.height, alignment: .topLeading)
            PriceAndBasketSectionList(card: card, addToCard: $addToCard)
        }
        .frame(width: mainFrame.width, height: mainFrame.height)
        .background(Color.white)
    }
}

struct PriceAndBasketSectionList: View {
    var card: ProductCard
    
    private let priceMainFontSize: CGFloat = 20
    private let priceFractionFontSize: CGFloat = 16
    private let oldPriceFontSize: CGFloat = 12
    private let priceMaxWidth: CGFloat = 66
    private let priceMaxHeight: CGFloat = 22
    private let fractionMaxWidth: CGFloat = 50
    private let fractionMaxHeight: CGFloat = 22
    private let oldPriceMaxWidth: CGFloat = 78
    private let oldPriceMaxHeight: CGFloat = 22
    private let pricePaddingLeading: CGFloat = 2
    private let imagePriceSize: CGFloat = 20
    private let priceAndBasketFrameSizeList: CGSize = CGSize(width: 199, height: 44)
    
    @Binding var addToCard: Bool
    @State private var isButtonLocked = false
    
    @State var countKg: Float = 0.1
    @State var countInt: Int = 1
    @State var coastCount: Float = 0.0
    
    private let mainPriceMaxWidth: CGFloat = 104
    private let mainPriceMaxHeight: CGFloat = 36
    
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
                    
                    // Old Price
                    ZStack {}
                    let formattedOldPrice = String(format: "%.2f", card.oldPrice)
                    
                    Text("\(formattedOldPrice)")
                        .frame(maxWidth: oldPriceMaxWidth, maxHeight: oldPriceMaxHeight)
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: oldPriceFontSize))
                        .strikethrough()
                        .foregroundColor(.mainCard)
                        .opacity(0.6)
                }
                .frame(maxWidth: 104, maxHeight: 36, alignment: .topLeading)
                .padding(.leading, 4)
                .padding(.top, 4)
                .padding(.bottom, 4)
            }
            .frame(width: mainFrame.width, height: mainFrame.height, alignment: .bottomLeading)
            
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
                        .frame(width: priceAndBasketFrameSizeList.width, height: priceAndBasketFrameSizeList.height, alignment: .bottomTrailing)
                    }
                    .padding(.top, 5)
                    .background(.white)
                }
            }
            .frame(width: mainFrame.width, height: mainFrame.height, alignment: .bottomTrailing)
        }
        .frame(width: mainFrame.width, height: mainFrame.height, alignment: .bottomTrailing)
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


// Basket
//ZStack {
//    RoundedRectangle(cornerRadius: 40)
//        .frame(width: 48, height: 36)
//        .foregroundColor(.basketBackground)
//    
//    
//    Image("BasketIcon")
//        .resizable()
//        .scaledToFit()
//        .frame(width: 16, height: 16)
//}
//.padding(.bottom, 4)
//.padding(.trailing, 4)
//.frame(width: mainFrame.width, height: mainFrame.height, alignment: .bottomTrailing)
