//
//  SpecialModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import Foundation

struct SpecialModel {
    let title: String
    let subtitle: String
    let button: String
    
    static let dummyList = [
        SpecialModel(title: StringConstants.HomeView.secialOffer,
                     subtitle: StringConstants.HomeView.discoverOurExclusive,
                     button: StringConstants.HomeView.seeMore),
        
        SpecialModel(title: StringConstants.HomeView.secialOffer,
                     subtitle: StringConstants.HomeView.specialPrice,
                     button: StringConstants.HomeView.seeMore),
        
        SpecialModel(title: "Enes Sancar",
                     subtitle: "enes57751907@gmail.com",
                     button: "@enes57")
    ]
}
