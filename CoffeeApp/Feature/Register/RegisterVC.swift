//
//  RegisterVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 1.11.2023.
//

import UIKit
import SnapKit

final class RegisterVC: UIViewController {
    //MARK: - Properties
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = .loginLogo
        return imageView
    }()
    
    private let photoPickerManager = PhotoPickerManager()
    
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = .defaultProfile
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isUserInteractionEnabled = true
        imageView.layer.cornerRadius = AppConstant.profileImageSize / 2
        imageView.tintColor = AppColors.ambassadorBlue.color
        return imageView
    }()
    
   private lazy var editProfileImageButton: UIButton = {
       let button = UIButton()
       button.setImage(UIImage(systemName: "photo.badge.plus"), for: .normal)
       button.addTarget(self, action: #selector(handleSelectProfileImageView), for: .touchUpInside)
       button.tintColor = AppColors.ambassadorBlue.color
       button.layer.cornerRadius = AppConstant.iconSize / 2
       var configration = UIButton.Configuration.plain()
       configration.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
       button.configuration = configration
       return button
   }()
    private let nameTextField = CustomTextField(fieldType: .name)
    private let userNameTextField = CustomTextField(fieldType: .username)
    private let emailTextField = CustomTextField(fieldType: .email)
    private let passwordTextField = CustomTextField(fieldType: .password)
    private let registerButton = CustomButton(title: StringConstants.Login.register)
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        photoPickerManager.delegate = self
        setupUI()
        setupLayout()
    }
    
}
//MARK: - Helpers
extension RegisterVC {
    private func setupUI() {
        
        view.addSubview(logoImageView)
        view.addSubview(profileImageView)
        view.addSubview(editProfileImageButton)
        view.addSubview(nameTextField)
        view.addSubview(userNameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(registerButton)
        
        registerButton.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
    }
    
    private func setupLayout() {
        
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(-7 * CGFloat.margin)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(AppConstant.profileImageSize)
        }
       
        
        editProfileImageButton.snp.makeConstraints { make in
            make.bottom.right.equalTo(profileImageView)
            make.width.height.equalTo(AppConstant.iconSize)
        }
     
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-20)
            make.height.equalTo(50)
        }
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.left.right.height.equalTo(nameTextField)
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(10)
            make.right.left.height.equalTo(nameTextField)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.left.right.height.equalTo(nameTextField)
        }
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.left.right.height.equalTo(nameTextField)
        }
    }
}
//MARK: - Selector
extension RegisterVC {
    @objc private func handleSelectProfileImageView() {
        photoPickerManager.presentPhotoPicker(on: self)
    }
    @objc private func handleRegister() {
        guard let email = emailTextField.text,
              let password = passwordTextField.text,
              let name = nameTextField.text,
              let username = userNameTextField.text,
              let profileImage = profileImageView.image else {
            showAlert(title: StringConstants.General.error, message: StringConstants.General.fillFields)
            return
        }
        if email.isEmpty || password.isEmpty || name.isEmpty || username.isEmpty {
            showAlert(title: StringConstants.General.error, message: StringConstants.General.fillFields)
        } else {
            AuthenticationService.shared.signUp(email: email, password: password, name: name, username: username, profileImage: profileImage) { result in
                switch result {
                case .success:
                    self.showAlert(title: StringConstants.General.success, message: StringConstants.General.registerSuccess) {
                        self.navigationController?.popToRootViewController(animated: true)
                    }

                case .failure(let error):
                    self.showAlert(title: StringConstants.General.error,
                                   message: error.localizedDescription )
                }
            }
        }
    }
}
//MARK: - PhotoPickerManagerDelegate Methods
extension RegisterVC: PhotoPickerManagerDelegate {
    func didPickImage(_ image: UIImage) {
        profileImageView.image = image
    }
}
