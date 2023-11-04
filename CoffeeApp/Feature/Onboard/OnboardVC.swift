//
//  OnboardVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import UIKit

final class OnboardVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnboardView()
    }
    
    private func configureOnboardView() {
        let onboardView = OnboardView(frame: view.bounds)
        view.addSubview(onboardView)
        onboardView.delegate = self
    }
}

extension OnboardVC: OnboardViewProtocol {
    func didTapStartButton() {
        let loginVC = LoginVC()
        navigationController?.pushViewController(loginVC, animated: true)
    }
}
