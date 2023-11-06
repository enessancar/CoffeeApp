//
//  RegisterVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 1.11.2023.
//

import UIKit
import SnapKit

final class RegisterVC: UIViewController {
    
    private var registerView = RegisterView()
    private let photoPickerManager = PhotoPickerManager()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        self.registerView = RegisterView(frame: view.bounds)
        view.addSubview(registerView)
        registerView.delegate = self
    }
}

extension RegisterVC: RegisterViewProtocol {
    
    func editProfileImageButtonTapped() {
        photoPickerManager.presentPhotoPicker(on: self)
    }
    
    func registerButtonTapped() {
        guard let email = registerView.emailTextField.text,
              let password = registerView.passwordTextField.text,
              let name = registerView.nameTextField.text,
              let username = registerView.userNameTextField.text,
              let profileImage = registerView.profileImageView.image else {
            showAlert(title: StringConstants.General.error, message: StringConstants.General.fillFields)
            return
        }
        if email.isEmpty || password.isEmpty || name.isEmpty || username.isEmpty {
            showAlert(title: StringConstants.General.error, message: StringConstants.General.fillFields)
        } else {
            AuthenticationService.shared.signUp(email: email, password: password, name: name, username: username, profileImage: profileImage) { result in
                switch result {
                case .success:
                    self.showAlert(title: StringConstants.General.success, message: StringConstants.General.registerSuccess)
                    self.navigationController?.popViewController(animated: true)
                    
                case .failure(let error):
                    self.showAlert(title: StringConstants.General.error,
                                   message: error.localizedDescription )
                }
            }
        }
    }
}

extension RegisterVC: PhotoPickerManagerDelegate {
    func didPickImage(_ image: UIImage) {
        registerView.profileImageView.image = image
    }
}
