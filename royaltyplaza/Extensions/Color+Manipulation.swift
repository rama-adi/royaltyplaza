//
//  Color+StringHexColor.swift
//  royaltyplaza
//
//  Created by Rama Adi Nugraha on 28/05/23.
//

import Foundation

import SwiftUI


extension Color {
    init(hex: String) {
        var formattedHex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        if formattedHex.hasPrefix("#") {
            formattedHex.remove(at: formattedHex.startIndex)
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: formattedHex).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        let color = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
        self.init(color)
    }
    
    func lighten(by percentage: CGFloat) -> Color {
        guard percentage > 0 else { return self }
        
        let multiplier = 1 + percentage / 100
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var opacity: CGFloat = 0
        
        UIColor(self).getRed(&red, green: &green, blue: &blue, alpha: &opacity)
        
        red = min(red * multiplier, 1.0)
        green = min(green * multiplier, 1.0)
        blue = min(blue * multiplier, 1.0)
        
        return Color(red: red, green: green, blue: blue, opacity: opacity)
    }
    
    func desaturate(by percentage: CGFloat) -> Color {
           guard percentage > 0 else { return self }
           
           let multiplier = 1 - percentage / 100
           
           var hue: CGFloat = 0
           var saturation: CGFloat = 0
           var brightness: CGFloat = 0
           var opacity: CGFloat = 0
           
           UIColor(self).getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &opacity)
           
           saturation = max(saturation * multiplier, 0)
           
           return Color(hue: hue, saturation: saturation, brightness: brightness, opacity: opacity)
       }
}

