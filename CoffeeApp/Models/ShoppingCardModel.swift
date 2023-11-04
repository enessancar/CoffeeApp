//
//  ShoppingCardModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

struct ShoppingCardModel: Codable, Equatable {
    let userID: String
    var items: [ShoppingCardItemModel]
    
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw CustomError.unableToParseFromJSON
        }
        return dictionary
    }
    
    static func fromDictionary(jsonData: Data) throws -> ShoppingCardModel {
         do {
             return try JSONDecoder().decode(ShoppingCardModel.self, from: jsonData)
         } catch {
             throw CustomError.unableToParseFromJSON
         }
     }
}
