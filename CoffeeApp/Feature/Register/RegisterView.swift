//
//  RegisterView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 1.11.2023.
//
/*
import UIKit
import SnapKit

protocol RegisterViewProtocol {
    func registerButtonTapped()
    func editProfileImageButtonTapped()
}

final class RegisterView: UIView {
    
    var delegate: RegisterViewProtocol?
    
    //MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .loginLogo
        return imageView
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = AppConstant.profileImageSize / 2
        imageView.image = .defaultProfile
        imageView.tintColor = AppColors.ambassadorBlue.color
        return imageView
    }()
    
    private lazy var editProfileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
        button.tintColor = AppColors.ambassadorBlue.color
        button.layer.cornerRadius = AppConstant.iconSize / 2
        var configration = UIButton.Configuration.plain()
        configration.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        button.configuration = configration
        return button
    }()
    
    let nameTextField = CustomTextField(fieldType: .name)
    let userNameTextField = CustomTextField(fieldType: .username)
    let emailTextField = CustomTextField(fieldType: .email)
    let passwordTextField = CustomTextField(fieldType: .password)
    let registerButton = CustomButton(title: StringConstants.Login.register)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLogoImageView()
        setupProfileImageView()
        setupEditProfilemageView()
        setupTextFields()
        setupRegisterButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupLogoImageView() {
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func setupProfileImageView() {
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(-7 * CGFloat.margin)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(AppConstant.profileImageSize)
        }
    }
    
    private func setupEditProfilemageView() {
        addSubview(editProfileImageButton)
        editProfileImageButton.addTarget(self, action: #selector(didSelectEditProfileImage), for: .touchUpInside)
        
        editProfileImageButton.snp.makeConstraints { make in
            make.bottom.right.equalTo(profileImageView)
            make.width.height.equalTo(AppConstant.iconSize)
        }
    }
    
    private func setupTextFields() {
        addSubviews(nameTextField, userNameTextField,
                    emailTextField, passwordTextField)
        
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(2 * CGFloat.margin)
            make.leading.equalToSuperview().offset(2 * CGFloat.margin)
            make.trailing.equalToSuperview().offset(-2 * CGFloat.margin)
            make.height.equalTo(50)
        }
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(CGFloat.margin)
            make.leading.trailing.height.equalTo(nameTextField)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(CGFloat.margin)
            make.trailing.leading.height.equalTo(nameTextField)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(CGFloat.margin)
            make.leading.trailing.height.equalTo(nameTextField)
        }
    }
    
    private func setupRegisterButton() {
        addSubview(registerButton)
        registerButton.addTarget(self, action: #selector(didTapRegister), for: .touchUpInside)
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(2 * CGFloat.margin)
            make.leading.trailing.height.equalTo(nameTextField)
        }
    }
}

extension RegisterView {
    @objc private func didTapRegister() {
        delegate?.registerButtonTapped()
    }
      
    @objc private func didSelectEditProfileImage() {
        delegate?.editProfileImageButtonTapped()
    }
}
*/
