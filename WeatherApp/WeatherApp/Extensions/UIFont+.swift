//
//  UIFont+.swift
//  weatherAppBang
//
//  Created by 방민지 on 2023/10/23.
//

import UIKit

extension UIFont {
    static func sfPro(size fontSize: CGFloat, weight: UIFont.Weight) -> UIFont {
        for family in UIFont.familyNames {
          print(family)

          for sub in UIFont.fontNames(forFamilyName: family) {
            print("====> \(sub)")
          }
        }
        
        let familyName = "SFProText"
        
        var weightString: String
        switch weight {
        case .bold:
            weightString = "Bold"
        case .medium:
            weightString = "Medium"
        case .regular:
            weightString = "Regular"
        case .thin:
            weightString = "Thin"
        case .light:
            weightString = "Light"
        default:
            weightString = "Medium"
        }
        
        return UIFont(name: "\(familyName)-\(weightString)", size: fontSize)!
    }
}
