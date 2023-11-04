//
//  LoginLogoImageView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import UIKit

final class LoginLogoImageView: UIImageView {
    init(imageName: String) {
        super.init(frame: .zero)
        contentMode = .scaleAspectFill
        clipsToBounds = true
        image = UIImage(named: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
