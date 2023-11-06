//
//  SearchVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit

final class SearchVC: UIViewController {
    
    private let searchView = SearchView()
    
    private var coffees: [(CoffeeCategoryModel, [CoffeeModel])]?
    private var filteredCategoriesWithCoffee: [(CoffeeCategoryModel, [CoffeeModel])]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.rightBarButtonItems = [searchView.navbarFavoriteButton,
                                              searchView.spacerBarButtonItem, searchView.navbarBasketButton]
        searchView.delegate = self
        searchView.searchBar.delegate = self
        
        searchView.tableView.delegate = self
        searchView.tableView.dataSource = self
        
        coffees = AppData.shared.categoriesWithCoffee
        filteredCategoriesWithCoffee = coffees
        
        let searchView = SearchView(frame: view.bounds)
        view.addSubview(searchView)
    }
}

extension SearchVC: SearchViewProtocol {
    func favoriteButtonTapped() {
        let vc = WishlistVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func basketButtonTapped() {
        let vc = BasketVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        filteredCategoriesWithCoffee?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredCategoriesWithCoffee?[section].1.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coffee = filteredCategoriesWithCoffee?[indexPath.section].1[indexPath.row]
        let detailVC = CoffeeDetailVC()
        detailVC.coffee = coffee
        navigationController?.pushViewController(detailVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WishListTableViewCell.identifier, for: indexPath) as? WishListTableViewCell else {
            fatalError()
        }
        let coffe = filteredCategoriesWithCoffee?[indexPath.section].1[indexPath.row]
        if let coffe {
            cell.configureCell(coffee: coffe)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: .init(x: 0, y: 0, width: tableView.bounds.width, height: 50))
        headerView.backgroundColor = AppColors.backView.color
        headerView.layer.cornerRadius = Radius.large.rawValue
        
        let titleLabel = UILabel(frame: .init(x: 20, y: 0, width: headerView.frame.width, height: 50))
        
        titleLabel.text = filteredCategoriesWithCoffee?[section].0.categoryName
        titleLabel.font = .boldSystemFont(ofSize: FontSize.subHeadline)
        titleLabel.textAlignment = .center
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCategoriesWithCoffee = coffees
        } else {
            filteredCategoriesWithCoffee = coffees?.compactMap({ coffeeCategoryAndModel -> (CoffeeCategoryModel, [CoffeeModel])? in
                let matchingCoffees = coffeeCategoryAndModel.1.filter { $0.name.lowercased().contains(searchText.lowercased()) }
                if matchingCoffees.isEmpty {
                    return nil
                } else {
                    return (coffeeCategoryAndModel.0, matchingCoffees)
                }
            })
        }
        DispatchQueue.main.async {
            self.searchView.tableView.reloadData()
        }
    }
}
