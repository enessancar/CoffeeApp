//
//  SearchView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 4.11.2023.
//

import UIKit
import SnapKit

protocol SearchViewProtocol {
    func favoriteButtonTapped()
    func basketButtonTapped()
}

final class SearchView: UIView {
    
    var delegate: SearchViewProtocol?
    
    lazy var favoriteButton: UIButton = createNavigationBarButton(
        with: Icons.heart,
        action: #selector(didTapFavoriteButton))
    
    lazy var basketButton: UIButton = createNavigationBarButton(
        with: Icons.cart,
        action: #selector(didTapBasketButton))
    
    lazy var navbarFavoriteButton = UIBarButtonItem(customView: favoriteButton)
    lazy var navbarBasketButton   = UIBarButtonItem(customView: basketButton)
    
    lazy var spacerBarButtonItem: UIBarButtonItem = {
        let spacer = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 24))
        return UIBarButtonItem(customView: spacer)
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = StringConstants.Search.placeHolder
        searchBar.backgroundImage = UIImage()
        searchBar.layer.cornerRadius = Radius.large.rawValue
        searchBar.layer.shadowOpacity = 0.23
        searchBar.layer.shadowRadius = Radius.small.rawValue
        searchBar.layer.shadowOffset = CGSize(width: 0, height: 6)
        searchBar.layer.shadowColor = AppColors.special.color.cgColor
        return searchBar
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 120
        tableView.separatorStyle = .none
        tableView.register(WishListTableViewCell.self, forCellReuseIdentifier: WishListTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
    }
    
    private func setupLayout() {
        addSubviews(searchBar, tableView)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(CGFloat.margin)
            make.leading.equalToSuperview().offset(2 * CGFloat.margin)
            make.trailing.equalToSuperview().offset(-2 * CGFloat.margin)
            make.height.equalTo(6 * CGFloat.margin)
            
            tableView.snp.makeConstraints { make in
                make.top.equalTo(searchBar.snp.bottom).offset(CGFloat.margin)
                make.leading.trailing.equalToSuperview()
                make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            }
        }
    }
}

extension SearchView {
    @objc private func didTapFavoriteButton() {
        delegate?.favoriteButtonTapped()
    }
    
    @objc private func didTapBasketButton() {
        delegate?.basketButtonTapped()
    }
}

extension SearchView {
    private func createNavigationBarButton(with iconName: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setImage(UIImage(systemName: iconName), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
}
