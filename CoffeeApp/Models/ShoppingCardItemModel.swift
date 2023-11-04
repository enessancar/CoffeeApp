//
//  ShoppingCardItemModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

struct ShoppingCardItemModel: Codable, Equatable {
    let coffeeID: String
    var quantity: Int
    
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw CustomError.unableToParseFromJSON
        }
        return dictionary
    }
    
    static func fromDictionary(jsonData: Data) throws -> ShoppingCardItemModel {
        do {
            return try JSONDecoder().decode(ShoppingCardItemModel.self, from: jsonData)
        } catch {
            throw CustomError.unableToParseFromJSON
        }
    }
}
