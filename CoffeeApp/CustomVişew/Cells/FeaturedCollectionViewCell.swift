//
//  FeaturedCollectionViewCell.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

protocol FeaturedCollectionViewCellDelegate: AnyObject {
    func didTapFavoriteButton(in cell: FeaturedCollectionViewCell)
    func didTapBasketButton(in cell: FeaturedCollectionViewCell)
}

final class FeaturedCollectionViewCell: UICollectionViewCell {
    static let identifier = "FeaturedCollectionViewCell"
    
    var delegate: FeaturedCollectionViewCellDelegate?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = Radius.large.rawValue
        return view
    }()
    
    private let coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Radius.medium.rawValue
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: FontSize.body)
        label.textAlignment = .left
        return label
    }()
    
    private let iconStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = .padding
        return stackView
    }()
    
    private lazy var favoriteButton = createButton(with: Icons.heart, color: .lightGray, action: #selector(favoriteButtonTapped))
    
    private lazy var basketButton = createButton(with: Icons.cart, color: .darkGray, action: #selector(basketButtonTapped))
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = Radius.medium.rawValue
        
        setupUI()
        setupCoffeeImageView()
        setupPriceLabel()
        setupStackView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with model: CoffeeModel) {
        coffeeImageView.kf.setImage(with: model.imageURL.asUrl)
        priceLabel.text = "\(model.price)₺"
    }
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(coffeeImageView)
        containerView.addSubview(priceLabel)
        
        iconStackView.addArrangedSubview(favoriteButton)
        iconStackView.addArrangedSubview(basketButton)
        
        containerView.addSubview(iconStackView)
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupCoffeeImageView() {
        coffeeImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(CGFloat.margin)
            make.trailing.equalToSuperview().offset(-CGFloat.margin)
            make.height.equalTo(100)
        }
    }
    
    private func setupPriceLabel() {
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeImageView.snp.bottom).offset(CGFloat.margin)
            make.leading.equalToSuperview().offset(CGFloat.margin)
        }
    }
    
    private func setupStackView() {
        iconStackView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(CGFloat.padding)
            make.centerY.equalTo(priceLabel)
        }
    }
}

extension FeaturedCollectionViewCell {
    @objc private func favoriteButtonTapped() {
        delegate?.didTapFavoriteButton(in: self)
    }
    
    @objc private func basketButtonTapped() {
        delegate?.didTapBasketButton(in: self)
    }
}

extension FeaturedCollectionViewCell {
    private func createButton(with iconName: String,
                              color: UIColor,
                              action: Selector) -> UIButton {
        
        let button = UIButton()
        button.setImage(UIImage(systemName: iconName), for: .normal)
        button.tintColor = color
        button.addTarget(self, action: action, for: .touchUpInside)
        return button
    }
}
