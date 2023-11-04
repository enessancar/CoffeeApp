//
//  UserManager.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 31.10.2023.
//

import Foundation

final class UserManager {
    static let shared = UserManager()
    var currentUser: UserModel?
    
    private init() {}
    
    func updateUser(_ user: UserModel) {
        self.currentUser = user
    }
    
    func clearUser() {
        currentUser = nil
    }
    
    func addWishlist(coffee: CoffeeModel,
                     completion: @escaping(Bool) -> ()) {
        
        guard var user = UserManager.shared.currentUser else {
            completion(false)
            return
        }
        let wishlistItem = WishlistItemModel(coffeeID: coffee.coffeeID, addedDate: Date())
        if let index = user.wishlist.firstIndex(where: { $0.coffeeID == coffee.coffeeID }) {
            user.wishlist.remove(at: index)
        } else {
            user.wishlist.append(wishlistItem)
        }
        updateUser(user)
    }
    
    func addCoffeeToBasket(coffee: CoffeeModel, completion: @escaping (Bool) -> Void) {
        guard var user = self.currentUser else {
            completion(false)
            return
        }
    }
}
