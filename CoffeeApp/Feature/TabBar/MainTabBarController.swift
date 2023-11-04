//
//  MainTabBar.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func configureVC() {
        viewControllers = [
            createNavController(for: HomeVC(),
                                title: StringConstants.MainTabBar.home,
                                imageName: Icons.home),
            
            createNavController(for: SearchVC(),
                                title: StringConstants.MainTabBar.search,
                                imageName: Icons.search),
            
            createNavController(for: PostVC(),
                                title: StringConstants.MainTabBar.post,
                                imageName: Icons.post),
            
            createNavController(for: DiscoverVC(),
                                title: StringConstants.MainTabBar.discover,
                                imageName: Icons.discover),
            
            createNavController(for: SettingsVC(),
                                title: StringConstants.MainTabBar.settings,
                                imageName: Icons.settings)
        ]
    }
    
    fileprivate func createNavController(for viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = .systemBackground
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: imageName)
        navController.navigationBar.tintColor = .systemRed
        return navController
    }
    
    private func configureTabBar() {
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.23
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 1)
        tabBar.layer.shadowRadius = 5
        tabBar.backgroundColor = .white
        tabBar.tintColor = AppColors.special.color
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        } else {
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
    }
}
