//
//  CustomRoundedShape.swift
//  SparIosApp
//
//  Created by Artem on 8/10/24.
//

import SwiftUI

struct CustomRoundedShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
