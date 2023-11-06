//
//  CoffeDetailView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 5.11.2023.
//

import UIKit
import SnapKit
import Kingfisher

protocol CoffeeDetailViewProtocol {
    func basketButtonTapped()
    func favoriteButtonTapped()
}

final class CoffeeDetailView: UIView {
    
    var coffee: CoffeeModel? = nil
    var delegate: CoffeeDetailViewProtocol?
    
    //MARK: - Properties
    private let coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: FontSize.headline)
        return label
    }()
    
    private let addToBasketButton = CustomButton(title: StringConstants.General.addToBasket)
    
    let favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Icons.heart), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        return button
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupCoffeeImageView()
        setupFavoriteButton()
        setupDescriptionLabel()
        setupPriceLabel()
        setupAddToBasketButton()
        
        configureProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureProperties() {
        addToBasketButton.addTarget(self,
                                    action: #selector(didTapBasketButton),
                                    for: .touchUpInside)
        
        favoriteButton.addTarget(self,
                                 action: #selector(didTapFavoriteButton),
                                 for: .touchUpInside)
        
        if let coffee {
            descriptionLabel.text = coffee.description
            priceLabel.text = "\(coffee.price)₺"
            
            DispatchQueue.main.async {
                self.coffeeImageView.kf.setImage(with: coffee.imageURL.asUrl)
                
                if let wishlist = UserManager.shared.currentUser?.wishlist {
                    if wishlist.contains(where: {$0.coffeeID == coffee.coffeeID}) {
                        self.favoriteButton.tintColor = .red
                    } else {
                        self.favoriteButton.tintColor = .gray
                    }
                }
            }
        }
    }
}

//MARK: - Layout
extension CoffeeDetailView {
    private func setupCoffeeImageView() {
        addSubview(coffeeImageView)
        coffeeImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
    private func setupFavoriteButton() {
        addSubview(favoriteButton)
        favoriteButton.snp.makeConstraints { make in
            make.top.equalTo(coffeeImageView.snp.top).offset(CGFloat.margin)
            make.trailing.equalToSuperview().offset(-CGFloat.margin)
            make.width.height.equalTo(40)
        }
    }
    
    private func setupDescriptionLabel() {
        addSubview(descriptionLabel)
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeImageView.snp.bottom).offset(CGFloat.padding)
            make.leading.equalToSuperview().offset(CGFloat.padding)
            make.trailing.equalToSuperview().offset(-CGFloat.padding)
        }
    }
    
    private func setupPriceLabel() {
        addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(CGFloat.padding)
            make.trailing.equalToSuperview().offset(-2 * CGFloat.padding)
        }
    }
    
    private func setupAddToBasketButton() {
        addSubview(addToBasketButton)
        addToBasketButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(4 * CGFloat.margin)
            make.trailing.equalToSuperview().offset(-4 * CGFloat.margin)
            make.height.equalTo(50)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-5 * CGFloat.margin)
        }
    }
}

//MARK: - Objc Func
extension CoffeeDetailView {
    @objc private func didTapBasketButton() {
        delegate?.basketButtonTapped()
    }
    
    @objc private func didTapFavoriteButton() {
        delegate?.favoriteButtonTapped()
    }
}
