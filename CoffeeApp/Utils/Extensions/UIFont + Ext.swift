//
//  UIFont + Ext.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 27.10.2023.
//

import UIKit

extension UIFont {
    var boldVersion: UIFont {
        guard let descriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: .zero)
    }
}
