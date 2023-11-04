//
//  AppData.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 3.11.2023.
//

import Foundation

final class AppData {
    static let shared = AppData()
    private init() {}
    
    var categoriesWithCoffee: [(CoffeeCategoryModel, [CoffeeModel])]?
}
