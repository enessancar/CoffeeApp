//
//  ProfileVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit
import SwiftUI
import SnapKit

final class SettingsVC: UIViewController {
    
    private var settingsVC: UIHostingController<SettingsView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSettingsView()
    }
    
    private func addSettingsView() {
        let settingsView = UIHostingController(
            rootView: SettingsView(viewModel: SettingsViewModel(
                cellViewModels: SettingsOption.allCases.compactMap({
                    return SettingsCellViewModel(type: $0)
                }))))
        addChild(settingsView)
        settingsView.didMove(toParent: self)
        
        view.addSubview(settingsView.view)
        
        settingsView.view.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
}
