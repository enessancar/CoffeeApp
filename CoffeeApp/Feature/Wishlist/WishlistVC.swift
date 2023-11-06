//
//  WishlistVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 4.11.2023.
//

import UIKit
import SnapKit

final class WishlistVC: UIViewController {
    
    private var wishlistCoffees: [CoffeeModel] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.separatorStyle = .none
        tableView.register(WishListTableViewCell.self,
                           forCellReuseIdentifier: WishListTableViewCell.identifier)
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWishlist()
        setupUI()
        fetchWishlist()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = StringConstants.WishlistVC.wishlist
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            
            tableView.dataSource = self
            tableView.delegate   = self
        }
    }
    
    private func fetchWishlist() {
        guard let userId = UserManager.shared.currentUser?.userID else {
            return
        }
        DataService.shared.listenToUserWishlist(userID: userId) { result in
            switch result {
            case .success(let wishlistItem):
                self.populateWishlistCoffees(with: wishlistItem)
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    private func populateWishlistCoffees(with wishlistItems: [WishlistItemModel]) {
        guard let categoriesWithCoffee = AppData.shared.categoriesWithCoffee else { return }
        
        wishlistCoffees.removeAll()
        for wishlistItem in wishlistItems {
            for (_, coffees) in categoriesWithCoffee {
                if let coffee = coffees.first(where: { $0.coffeeID == wishlistItem.coffeeID }) {
                    wishlistCoffees.append(coffee)
                }
            }
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension WishlistVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        wishlistCoffees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WishListTableViewCell.identifier, for: indexPath) as? WishListTableViewCell else {
            fatalError()
        }
        let coffee = wishlistCoffees[indexPath.row]
        cell.configureCell(coffee: coffee)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let coffe = wishlistCoffees[indexPath.row]
        let detailVC = CoffeeDetailVC()
        detailVC.coffee = coffe
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
