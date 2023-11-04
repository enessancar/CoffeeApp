//
//  LoginView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit
import SnapKit

protocol LoginViewProtocol {
    func registerButtonTapped()
    func loginButtonTapped()
}

final class LoginView: UIView {
    
    var delegate: LoginViewProtocol?
    
    //MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .loginLogo
        return imageView
    }()
    
     let emailTextField = CustomTextField(fieldType: .email)
     let passwordTextField = CustomTextField(fieldType: .password)
    
    private let loginButton = CustomButton(title: StringConstants.Login.login)
    private let registerButton = CustomButton(
        title: StringConstants.Login.register,
        backgroundColor: AppColors.curiousChipmunk.color
    )
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLogoImageView()
        setupEmailTextField()
        setupPasswordTextField()
        setupLoginButton()
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
    
    private func setupEmailTextField() {
        addSubview(emailTextField)
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(2 * CGFloat.padding)
            make.leading.equalToSuperview().offset(2 * CGFloat.padding)
            make.trailing.equalToSuperview().offset(-2 * CGFloat.padding)
            make.height.equalTo(50)
        }
    }
    
    private func setupPasswordTextField() {
        addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(2 * CGFloat.padding)
            make.leading.trailing.height.equalTo(emailTextField)
        }
    }
    
    private func setupLoginButton() {
        addSubview(loginButton)
        loginButton.addTarget(self,
                              action: #selector(didTapLogin),
                              for: .touchUpInside)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(40)
            make.leading.trailing.height.equalTo(emailTextField)
        }
    }
    
    private func setupRegisterButton() {
        addSubview(registerButton)
        registerButton.addTarget(self,
                                 action: #selector(didTapRegister),
                                 for: .touchUpInside)
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(2 * CGFloat.padding)
            make.leading.trailing.height.equalTo(loginButton)
        }
    }
}

extension LoginView {
    @objc private func didTapRegister() {
        delegate?.registerButtonTapped()
    }
    
    @objc private func didTapLogin() {
        delegate?.loginButtonTapped()
    }
}
