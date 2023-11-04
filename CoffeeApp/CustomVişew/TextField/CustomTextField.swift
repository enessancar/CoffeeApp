//
//  CustomTextField.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit
import SnapKit

final class CustomTextField: UITextField {
    
    private let visibilityToggleButton = UIButton(type: .system)
    
    enum FieldType {
        case email
        case password
        case generic
        case name
        case username
    }
    
    var fieldType: FieldType = .generic {
        didSet {
            configureForType()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    convenience init(fieldType: FieldType) {
        self.init(frame: .zero)
        self.fieldType = fieldType
        configureForType()
    }
    
    private func commonInit() {
        layer.borderWidth = 1
        layer.borderColor = AppColors.ambassadorBlue.color.withAlphaComponent(0.25).cgColor
        
        layer.cornerRadius = Radius.medium.rawValue
        
        layer.shadowColor = AppColors.curiousChipmunk.color.cgColor
        layer.shadowOffset = .init(width: 0, height: 5)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        backgroundColor = .white
        clipsToBounds = false
        leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: frame.height))
        leftViewMode = .always
    }
    
    private func configureForType() {
        let iconSize: CGFloat = AppConstant.iconSize
        let padding: CGFloat = .padding
        
        let iconImageView = UIImageView(frame: .init(x: padding, y: (frame.height - iconSize) / 2, width: iconSize, height: iconSize))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .darkGray.withAlphaComponent(0.5)

        let viewWidth = iconSize + 2 * padding
        let leftIconView = UIView(frame: .init(x: 0, y: 0, width: viewWidth, height: frame.height))
        leftIconView.addSubview(iconImageView)
        
        switch fieldType {
        case .email:
            iconImageView.image = UIImage(systemName: Icons.email)
            keyboardType = .emailAddress
            placeholder = StringConstants.Login.email
            autocapitalizationType = .none
        case .password:
            iconImageView.image = UIImage(systemName: Icons.lock)
            keyboardType = .default
            isSecureTextEntry = true
            placeholder = StringConstants.Login.password
            autocapitalizationType = .none
            setupVisibilityButton()
        case .generic:
            keyboardType = .default
            isSecureTextEntry = false
            placeholder = StringConstants.General.enterText
        case .name:
            iconImageView.image = UIImage(systemName: Icons.user)
            keyboardType = .default
            isSecureTextEntry = false
            placeholder = StringConstants.Login.name
            autocapitalizationType = .words
        case .username:
            iconImageView.image = UIImage(systemName: Icons.userCard)
            keyboardType = .default
            isSecureTextEntry = false
            placeholder = StringConstants.Login.username
            autocapitalizationType = .none
        }
    }

    func setupVisibilityButton() {
        let imageName = isSecureTextEntry ? Icons.eyeSlash : Icons.eye
        let image = UIImage(systemName: imageName)
        
        visibilityToggleButton.setImage(image, for: .normal)
        visibilityToggleButton.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        visibilityToggleButton.tintColor = AppColors.ambassadorBlue.color.withAlphaComponent(0.3)
        
        rightView = visibilityToggleButton
        rightViewMode = .always
    }
    
    @objc
    private func toggleButtonTapped() {
        isSecureTextEntry.toggle()
        
        let imageName = isSecureTextEntry ? Icons.eyeSlash : Icons.eye
        let image = UIImage(systemName: imageName)
        visibilityToggleButton.setImage(image, for: .normal)
    }
}
