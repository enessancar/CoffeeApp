//
//  SettingsCellViewModel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 3.11.2023.
//

import UIKit

struct SettingsCellViewModel: Identifiable {
    let id = UUID()
    
    public let type: SettingsOption
    public let onTapHandler: (SettingsOption) -> ()
    
    //MARK: - Init
    init(type: SettingsOption, onTapHandler: @escaping(SettingsOption) -> ()) {
        self.type = type
        self.onTapHandler = onTapHandler
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
