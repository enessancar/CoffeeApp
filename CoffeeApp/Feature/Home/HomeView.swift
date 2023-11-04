//
//  HomeView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 2.11.2023.
//

import UIKit
import SnapKit

protocol HomeViewProtocol: AnyObject {
    func favoriteButtonTapped()
    func basketButtonTapped()
}

final class HomeView: UIView {
    
    var delegate: HomeViewProtocol?
    
    //MARK: - Properties
    private let userProfileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = AppColors.vanillaMocha.color.cgColor
        imageView.layer.cornerRadius = AppConstant.homeUserImageSize / 2
        return imageView
    }()
    
    private let welcomeLabel = CustomLabel()
    
    private lazy var favoriteButton = CustomButton(
        iconName: Icons.heart,action: #selector(didTapFavoriteButton))
    
    private lazy var basketButton = CustomButton(
        iconName: Icons.cart, action: #selector(didTapBasketButton))
    
    lazy var navBarFavoriteButton = UIBarButtonItem(customView: favoriteButton)
    lazy var navBarBasketButton = UIBarButtonItem(customView: basketButton)
    
    private lazy var spacerBarButtonItem: UIBarButtonItem = {
        let spacer = UIView(frame: .init(x: 0, y: 0, width: 1, height: 24))
        return UIBarButtonItem(customView: spacer)
    }()
    
    private lazy var categoryLabel = CustomLabel(
        text: StringConstants.General.categories,
        font: .boldSystemFont(ofSize: FontSize.headline))
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColors.backView.color
        return view
    }()
    
    
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}


extension HomeView {
    @objc private func didTapFavoriteButton() {
        delegate?.favoriteButtonTapped()
    }
    
    @objc private func didTapBasketButton() {
        delegate?.basketButtonTapped()
    }
}
