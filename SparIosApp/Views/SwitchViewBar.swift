//
//  SwitchViewBar.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct SwitchViewBar: View {
    @Binding var isGrid: Bool
    
    private let iconSize: CGFloat = 16
    private let buttonSize: CGFloat = 40
    private let buttonPadding: CGFloat = 11
    private let navBarHeight: CGFloat = 44
    private let buttonCornerRadius: CGFloat = 12
    private let navbarPadding: EdgeInsets = EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 8)
    
    var body: some View {
        HStack{
            Button(action:{
                isGrid.toggle()
            }){
                Image(isGrid ? .navigationIconGrid : .navigationIconList)
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconSize)
                    .frame(width: buttonSize, height: buttonSize)
                    .background(.navigationBar)
                    .cornerRadius(buttonCornerRadius)
                    .padding(buttonPadding)
            }
            Spacer()
        }
        .frame(width: .infinity, height: navBarHeight)
        .padding(navbarPadding)
        .overlay(
            Rectangle()
                .frame(height: 0.5)
                .foregroundColor(.divider), alignment: .bottom
        )
    }
}

