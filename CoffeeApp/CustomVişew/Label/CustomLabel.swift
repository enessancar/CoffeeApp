//
//  CustomLabel.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 2.11.2023.
//

import UIKit

final class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(text: String? = nil, font: UIFont? = nil) {
        self.init(frame: .zero)
        self.text = text
        self.font = font ?? .systemFont(ofSize: FontSize.subHeadline)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
