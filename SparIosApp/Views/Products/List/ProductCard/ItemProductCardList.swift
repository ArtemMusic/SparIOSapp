//
//  ItemProductCardList.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct ItemProductCardList: View {
    var card: ProductCard
    
    var body: some View {
        HStack{
            LeftSection(card: card)
            Spacer()
            RightSection(card: card)
        }
        .background(.white)
        .frame(width: 375, height: 176)
        
        Divider()
            .frame(width: 400)
        
    }
}
