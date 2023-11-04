//
//  CustomButton.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import UIKit

final class CustomButton: UIButton {
    
    init(title: String,
         backgroundColor: UIColor? = AppColors.special.color,
         titleColor: UIColor? = .white
    ) {
        super.init(frame: .zero)
        
        setTitle(title, for: .normal)
        self.backgroundColor = backgroundColor
        setTitleColor(titleColor, for: .normal)
        
        self.layer.cornerRadius = Radius.large.rawValue
        self.titleLabel?.font = .systemFont(ofSize: FontSize.body).boldVersion
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    
    convenience init(iconName: String, action: Selector) {
        self.init(frame: .zero)
        setImage(UIImage(systemName: iconName), for: .normal)
        tintColor = .black
        addTarget(self, action: action, for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

