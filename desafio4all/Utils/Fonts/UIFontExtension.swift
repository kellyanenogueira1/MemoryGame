//
//  UIFontExtension.swift
//  desafio4all
//
//  Created by Lidiane Gomes Barbosa on 15/12/20.
//

import Foundation
import UIKit
extension UIFont {
    static func customFont(ofSize fontSize: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "CartonSix", size: fontSize) else {
            fatalError("""
                Failed to load the "CartonSix" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
}
