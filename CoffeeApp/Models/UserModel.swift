//
//  UserModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

struct UserModel: Codable {
    let userID: String
    var name: String
    var username: String
    var email: String
    var balance: Double
    var profileImageURL: String
    var postIDs: [String]
    var shoppingCart: ShoppingCardModel
    var wishlist: [WishlistItemModel]
    
    func toDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw CustomError.unableToParseFromJSON
        }
        return dictionary
    }
    
    static func fromDictionary(jsonData: Data) throws -> UserModel {
         do {
             return try JSONDecoder().decode(UserModel.self, from: jsonData)
         } catch {
             throw CustomError.unableToParseFromJSON
         }
     }
}
