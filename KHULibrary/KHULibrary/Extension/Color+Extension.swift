//
//  Color+Extension.swift
//  KHULibrary
//
//  Created by 김소현 on 3/6/24.
//

import UIKit.UIColor

extension UIColor {
    static var KHURed: UIColor {
        return UIColor(hexCode: "B22F2B")
    }
    
    static var KHUBlue: UIColor {
        return UIColor(hexCode: "263A74")
    }
    
    static var KHUGold: UIColor {
        return UIColor(hexCode: "B6985A")
    }
    
    static var TEXTGray: UIColor {
        return UIColor(hexCode: "3C3C43").withAlphaComponent(0.5)
    }
}

extension UIColor {
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
