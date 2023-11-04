//
//  String+Ext.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

extension String {
    var asUrl: URL? {
        return URL(string: self)
    }
}
