//
//  CoffeeCategoryModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

struct CoffeeCategoryModel: Codable {
    let categoryID: String
    let categoryName: String
    var coffeeIDs: [String]
    
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw CustomError.unableToParseFromJSON
        }
        return dictionary
    }
    
    static func fromDictionary(jsonData: Data) throws -> CoffeeCategoryModel {
        do {
            return try JSONDecoder().decode(CoffeeCategoryModel.self, from: jsonData)
        } catch {
            throw CustomError.unableToParseFromJSON
        }
    }
}
