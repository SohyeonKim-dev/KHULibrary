//
//  Button+Extension.swift
//  KHULibrary
//
//  Created by 김소현 on 3/11/24.
//

import UIKit.UIButton

extension UIButton {
    func setRooundedButton(title: String, titleSize: Int, titleColor: UIColor, backgroundColor: UIColor, radius: CGFloat) {
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: CGFloat(titleSize), weight: .bold)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
