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
    
    func addWishList(coffee: CoffeeModel, completion: @escaping (Bool) -> Void) {
        guard var user = UserManager.shared.currentUser else {
            completion(false)
            return
        }
        let wishlistItem = WishlistItemModel(coffeeID: coffee.coffeeID, addedDate: Date())
        if let index = user.wishlist.firstIndex(where: {$0.coffeeID == coffee.coffeeID}) {
            user.wishlist.remove(at: index)
        } else {
            user.wishlist.append(wishlistItem)
        }
        updateUser(user)
        
        DataService.shared.updateWishList(userID: user.userID, WishListItem: wishlistItem) { result in
            switch result {
            case .success(_):
                completion(true)
            case .failure(let error):
                print("Error updating wishlist in Firestore: \(error.localizedDescription)")
                completion(false)
            }
        }
    }

    
    func addCoffeeToBasket(coffee: CoffeeModel, completion: @escaping (Bool) -> Void) {
        guard var user = self.currentUser else {
            completion(false)
            return
        }
        let newItem = ShoppingCardItemModel(coffeeID: coffee.coffeeID, quantity: 1)
        if let index = user.shoppingCart.items.firstIndex(where: { $0.coffeeID == coffee.coffeeID }) {
            user.shoppingCart.items[index].quantity += 1
        } else {
            
            user.shoppingCart.items.append(newItem)
        }
        self.updateUser(user)
        DataService.shared.addToBasket(coffeeID: coffee.coffeeID) { result in
            switch result {
            case .success():
                completion(true)
            case .failure(let error):
                print("Error adding coffee to basket: \(error.localizedDescription)")
                completion(false)
            }
        }
    }
}
