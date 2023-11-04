//
//  WishListTableViewCell.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class WishListTableViewCell: UITableViewCell {
    static let identifier = "WishListTableViewCell"
    
    private let containerView: UIView = {
        let view                 = UIView()
        view.backgroundColor     = .white
        view.layer.cornerRadius  = Radius.large.rawValue
        view.layer.shadowOpacity = 0.23
        view.layer.shadowRadius  = Radius.small.rawValue
        view.layer.shadowOffset  = .init(width: 0, height: 6)
        view.layer.shadowColor   = AppColors.special.color.cgColor
        return view
    }()
    
    private let coffeeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Radius.medium.rawValue
        return imageView
    }()
    
    private let coffeeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: FontSize.body)
        return label
    }()
    
    private let coffeeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: FontSize.body)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        
        setupContainerView()
        setupCoffeeImageView()
        setupcoffeeNameLabel()
        setupCoffeeDescriptionLabel()
        setupPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureCell(coffee: CoffeeModel) {
        coffeeNameLabel.text = coffee.name
        coffeeImageView.kf.setImage(with: coffee.imageURL.asUrl)
        coffeeDescriptionLabel.text = coffee.description
        priceLabel.text = "\(coffee.price)₺"
    }
    
    private func setupContainerView() {
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(CGFloat.margin)
            make.trailing.equalToSuperview().offset(-CGFloat.margin)
            make.height.equalTo(105)
        }
    }
    
    private func setupCoffeeImageView() {
        containerView.addSubview(coffeeImageView)
        coffeeImageView.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top).offset(CGFloat.padding)
            make.leading.equalToSuperview().offset(CGFloat.padding)
            make.width.equalTo(100)
            make.height.equalTo(90)
        }
    }
    
    private func setupcoffeeNameLabel() {
        containerView.addSubview(coffeeNameLabel)
        coffeeNameLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeImageView.snp.top)
            make.leading.equalTo(coffeeImageView.snp.trailing).offset(CGFloat.padding)
        }
    }
    
    private func setupCoffeeDescriptionLabel() {
        containerView.addSubview(coffeeDescriptionLabel)
        coffeeDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeNameLabel.snp.bottom).offset(CGFloat.padding)
            make.leading.equalTo(coffeeImageView.snp.trailing).offset(CGFloat.padding)
            make.trailing.equalToSuperview().offset(-CGFloat.padding)
        }
    }
    
    private func setupPriceLabel() {
        containerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(coffeeDescriptionLabel.snp.bottom).offset(CGFloat.padding)
            make.leading.equalTo(coffeeImageView.snp.trailing).offset(CGFloat.padding)
        }
    }
}
