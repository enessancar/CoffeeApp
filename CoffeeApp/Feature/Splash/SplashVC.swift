//
//  SplashVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 27.10.2023.
//

import UIKit
import SnapKit
import Lottie
import FirebaseAuth

final class SplashVC: UIViewController {
    
    private let animationView = LottieAnimationView(name: "LaunchScreen")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureAnimation()
        checkUserStatus()
    }
    
    private func configureAnimation() {
        view.addSubview(animationView)
        
        animationView.loopMode = .playOnce
        animationView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(700)
        }
        
        fetchCurrentUser()
        fetchCoffeeData()
    }
    
    private func checkUserStatus() {
        animationView.play { completed in
            if Auth.auth().currentUser != nil {
                let mainVC = MainTabBarController()
                self.navigationController?.setViewControllers([mainVC], animated: true)
            } else {
                let onboardVC = OnboardVC()
                self.navigationController?.setViewControllers([onboardVC], animated: true)
            }
        }
    }
    
    private func fetchCurrentUser() {
        guard let user = Auth.auth().currentUser else { return }
        AuthenticationService.shared.fetchUserFromFirestore(user: user) { result in
            switch result {
            case .success(let fetchedUser):
                UserManager.shared.updateUser(fetchedUser)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func fetchCoffeeData() {
        DataService.shared.fetchAllCategoriesWithCoffees { result in
            switch result {
            case .success(let data):
                AppData.shared.categoriesWithCoffee = data
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
