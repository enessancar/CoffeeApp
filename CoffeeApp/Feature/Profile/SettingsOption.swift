//
//  SettingsOption.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 3.11.2023.
//

import UIKit

enum SettingsOption: CaseIterable {
    case rateApp
    case contactUs
    case terms
    case pricavy
    case apiReference
    case viewCode
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            "Rate App"
        case .contactUs:
            "Contact Us"
        case .terms:
            "Terms of Service"
        case .pricavy:
            "Privacy Policy"
        case .apiReference:
            "API Reference"
        case .viewCode:
            "View App Code"
        }
    }
    
    var iconContainerColor: UIColor {
        switch self {
        case .rateApp:
            return .systemBlue
        case .contactUs:
            return .systemGreen
        case .terms:
            return .systemRed
        case .pricavy:
            return .systemYellow
        case .apiReference:
            return .systemOrange
        case .viewCode:
            return .systemPink
        }
    }
    
    var iconImage: UIImage? {
        switch self {
        case .rateApp:
            return UIImage(systemName: "star.fill")
        case .contactUs:
            return UIImage(systemName: "paperplane")
        case .terms:
            return UIImage(systemName: "doc")
        case .pricavy:
            return UIImage(systemName: "lock")
        case .apiReference:
            return UIImage(systemName: "list.clipboard")
        case .viewCode:
            return UIImage(systemName: "hammer.fill")
        }
    }
}
