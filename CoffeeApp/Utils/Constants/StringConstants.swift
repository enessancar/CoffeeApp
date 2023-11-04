//
//  StringConstants.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import Foundation

struct StringConstants {
    
    enum Login {
        static let email    = "Enter your email"
        static let password = "Enter your password"
        static let login    = "Login"
        static let register = "Register"
        static let name     = "Name"
        static let username = "Username"
    }
    
    enum General {
        static let enterText         = "Enter Text"
        static let ok                = "Ok"
        static let error             = "Error"
        static let fillFields        = "Please fill in all fields"
        static let success           = "Success"
        static let registerSuccess   = "Register Success"
        static let appName           = "Coffee App"
        static let categories        = "Categories"
        static let addToBasket       = "Add To Basket"
        static let deletedProduct    = "Deleted Product"
        static let subTotal          = "Subtotal"
        static let delivery          = "Delivery"
        static let total             = "Total"
        static let order             = "Order"
        static let search            = "Search"
        static let newPost           = "New Post"
        static let sharingPost       = "Post successfully shared!"
        static let signOut           = "Sign Out"
        static let coffeeCollections = "My cofee collections"
        static let coffee            = "Coffee"
        static let discoverText      = "Discover coffee lovers and share your favorite coffee"
        static let getStarted        = "Get Started"
    }
    
    enum HomeView {
        static let topCategories        = ["Espresso", "Cappuccino", "Latte"]
        static let bottomCategories     = ["Mocha", "Soğuk Kahve", "Filtre Kahve"]
        static let welcome              = "Welcome"
        static let secialOffer          = "Special Offer"
        static let discoverOurExclusive = "Discover our exclusive coffee offers now"
        static let seeMore              = "See more ->"
        static let specialPrice         = "Special Prices For You"
        static let featuredProduct      = "Featured Products"
        static let viewAll              = "View all"
        static let productAddedToCart   = "Product Added To Cart"
    }
    
    enum MainTabBar {
        static let home     = "Home"
        static let search   = "Search"
        static let discover = "Discover"
        static let settings  = "Settings"
        static let post     = "Post"
    }
    
    enum WishlistVC {
        static let wishlist = "Wish List"
    }
    
    enum BasketVC {
        static let basket = "Basket"
    }
    
    enum DateFormat {
        static let dayAgo    = "day ago"
        static let hourAgo   = "hour ago"
        static let minuteAgo = "min ago"
        static let secondAgo = "second ago"
        static let now       = "now"
    }
    
    enum Settings {
        static let contact   = "https://www.starbucks.com.tr/"
        static let privacy   = "https://www.starbuckschilled.com/uk/privacy-policy/"
        static let terms     = "https://www.starbucks.com/rewards/terms/"
        static let apiReference = "https://starbucks.docs.apiary.io/#"
        static let viewCode = "https://github.com/enessancar/CoffeeApp"
        static let rateApp = "https://apps.apple.com/tr/app/starbucks-t%C3%BCrkiye/id1100698915"
    }
}
