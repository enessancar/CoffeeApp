//
//  LoginVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit

final class LoginVC: UIViewController {
    
    private let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginView()
    }
    
    private func setupLoginView() {
        let loginView = LoginView(frame: view.bounds)
        view.addSubview(loginView)
        loginView.delegate = self
    }
    
}

extension LoginVC: LoginViewProtocol {
    
    func registerButtonTapped() {
        let registerVC = RegisterVC()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    func loginButtonTapped() {
        guard let email = loginView.emailTextField.text,
              let password = loginView.passwordTextField.text else {
            
            showAlert(title: StringConstants.General.error,
                      message: StringConstants.General.fillFields)
            return
        }
        if email.isEmpty || password.isEmpty {
            showAlert(title: StringConstants.General.error,
                      message: StringConstants.General.fillFields)
        } else {
            AuthenticationService.shared.signIn(email: email,
                                                password: password) { result in
                switch result {
                case .success(_):
                    let mainTabBar = MainTabBarController()
                    if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                        sceneDelegate.window?.rootViewController = mainTabBar
                    }
                case .failure(_):
                    self.showAlert(title: StringConstants.General.error,
                                   message: Errors.authenticationFailed)
                }
            }
        }
    }
}
