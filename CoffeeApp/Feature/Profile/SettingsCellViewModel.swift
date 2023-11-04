//
//  SettingsCellViewModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 3.11.2023.
//

import UIKit

struct SettingsCellViewModel: Identifiable, Hashable {
    let id = UUID()
    
    private let type: SettingsOption
    
    
    //MARK: - Init
    init(type: SettingsOption) {
        self.type = type
    }
    
    public var image: UIImage? {
        type.iconImage
    }
    
    public var title: String {
        type.displayTitle
    }
    
    public var iconContainerColor: UIColor {
        return type.iconContainerColor
    }
}
