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
    case privacy
    case apiReference
    case viewCode
    
    var targetUrl: URL? {
        switch self {
        case .rateApp:
            return URL(string: StringConstants.Settings.rateApp)
        case .contactUs:
            return URL(string: StringConstants.Settings.contact)
        case .terms:
            return URL(string: StringConstants.Settings.terms)
        case .privacy:
            return URL(string: StringConstants.Settings.privacy)
        case .apiReference:
            return URL(string: StringConstants.Settings.apiReference)
        case .viewCode:
            return URL(string: StringConstants.Settings.viewCode)
        }
    }
    
    var displayTitle: String {
        switch self {
        case .rateApp:
            return "Rate App"
        case .contactUs:
            return "Contact Us"
        case .terms:
            return "Terms of Service"
        case .privacy:
            return "Privacy Policy"
        case .apiReference:
            return "API Reference"
        case .viewCode:
            return "View App Code"
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
        case .privacy:
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
            return UIImage(systemName: Icons.rate)
        case .contactUs:
            return UIImage(systemName: Icons.contact)
        case .terms:
            return UIImage(systemName: Icons.terms)
        case .privacy:
            return UIImage(systemName: Icons.privacy)
        case .apiReference:
            return UIImage(systemName: Icons.apiReference)
        case .viewCode:
            return UIImage(systemName: Icons.viewCode)
        }
    }
}
