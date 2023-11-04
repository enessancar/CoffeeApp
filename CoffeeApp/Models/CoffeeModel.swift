//
//  CoffeeModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

struct CoffeeModel: Codable {
    let coffeeID: String
    var name: String
    var description: String
    var price: Double
    var imageURL: String
    var categoryID: String
    
    /// Coffe Modeli Dictionarye çevirme
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw CustomError.unableToParseFromJSON
        }
        return dictionary
    }
    
    /// JSON Datadan Coffee Model objesine dönüştürme
    static func fromDictionary(jsonData: Data) throws -> CoffeeModel {
        do {
            return try JSONDecoder().decode(CoffeeModel.self, from: jsonData)
        } catch {
            throw CustomError.unableToParseFromJSON
        }
    }
}
