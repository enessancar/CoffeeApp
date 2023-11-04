//
//  ProfileVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit
import SwiftUI
import SnapKit
import StoreKit
import FirebaseAuth

final class SettingsVC: UIViewController {
    
    private var settingsVC: UIHostingController<SettingsView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSettingsView()
        setupSignOutButton()
    }
    
    private func setupSignOutButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: Icons.signOut),
            style: .done,
            target: self,
            action: #selector(signOutButtonTapped))
        
        navigationItem.rightBarButtonItem?.tintColor = .red
    }
    
    private func addSettingsView() {
        let settingsView = UIHostingController(
            rootView: SettingsView(viewModel: SettingsViewModel(
                cellViewModels: SettingsOption.allCases.compactMap({
                    return SettingsCellViewModel(type: $0) { [weak self] option in
                        self?.handleTap(option: option)
                    }
                }))))
        addChild(settingsView)
        settingsView.didMove(toParent: self)
        
        view.addSubview(settingsView.view)
        
        settingsView.view.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    private func handleTap(option: SettingsOption) {
        guard Thread.current.isMainThread else {
            return
        }
        
        if let targetUrl = option.targetUrl {
            switch option {
            case .rateApp:
                Task { @MainActor [weak self] in
                    if let windowScene = self?.view.window?.windowScene {
                        SKStoreReviewController.requestReview(in: windowScene)
                    }
                }
            case .contactUs:
                presentSafariVC(url: targetUrl)
            case .terms:
                presentSafariVC(url: targetUrl)
            case .privacy:
                presentSafariVC(url: targetUrl)
            case .apiReference:
                presentSafariVC(url: targetUrl)
            case .viewCode:
                presentSafariVC(url: targetUrl)
            }
        }
    }
}

extension SettingsVC {
    @objc private func signOutButtonTapped() {
        AuthenticationService.shared.signOut()
        let onboardVC = SplashVC()
        navigationController?.setViewControllers([onboardVC], animated: true)
    }
}
