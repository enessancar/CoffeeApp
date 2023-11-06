//
//  CoffeeDetailVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 5.11.2023.
//

import UIKit
import SnapKit

final class CoffeeDetailVC: UIViewController {
    
    var coffee: CoffeeModel? = nil
    private lazy var detailView = CoffeeDetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCoffeeDetailView()
    }
    
    private func setupCoffeeDetailView() {
        let detailView = CoffeeDetailView(frame: view.bounds)
        view.addSubview(detailView)
        detailView.delegate = self
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = false
        title = coffee?.name ?? ""
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: FontSize.subHeadline)
        ]
    }
}

extension CoffeeDetailVC: CoffeeDetailViewProtocol {
    func favoriteButtonTapped() {
        if let coffee {
            DispatchQueue.main.async {
                UserManager.shared.addWishList(coffee: coffee) { isSucccess in
                    if isSucccess {
                        if let wishlist = UserManager.shared.currentUser?.wishlist {
                            if wishlist.contains(where: {$0.coffeeID == coffee.coffeeID}) {
                                self.detailView.favoriteButton.tintColor = .red
                            } else {
                                self.detailView.favoriteButton.tintColor = .gray
                            }
                        }
                    }
                }
            }
        }
    }
    
    func basketButtonTapped() {
        if let coffee {
            DispatchQueue.main.async {
                UserManager.shared.addCoffeeToBasket(coffee: coffee) { result in
                    if result {
                        self.showAlert(title: StringConstants.General.success,
                                       message: StringConstants.General.addToBasket)
                    } else {
                        self.showAlert(title: StringConstants.General.error,
                                       message: Errors.unknown)
                    }
                }
            }
        }
    }
}
