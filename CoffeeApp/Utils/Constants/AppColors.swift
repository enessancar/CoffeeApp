//
//  AppColors.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit

enum AppColors {
    case chinaCup
    case vanillaMocha
    case curiousChipmunk
    case ambassadorBlue
    case special
    case backView
    case discoverUserView
    
    var color: UIColor {
        switch self {
        case .chinaCup:
            return UIColor(red: 0.97, green: 0.94, blue: 0.90, alpha: 1.0)
        case .vanillaMocha:
            return UIColor(red: 0.92, green: 0.86, blue: 0.78, alpha: 1.0)
        case .curiousChipmunk:
            return UIColor(red: 0.85, green: 0.75, blue: 0.64, alpha: 1.0)
        case .ambassadorBlue:
            return UIColor(red: 0.99, green: 0.06, blue: 0.45, alpha: 1.0)
        case .special:
            return UIColor(red: 0.99, green: 0.06, blue: 0.45, alpha: 1.0)
        case .backView:
            return UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        case .discoverUserView:
            return UIColor(red: 0.99, green: 0.84, blue: 0.91, alpha: 1.0)
        }
    }
}
