//
//  BasketListTableViewCell.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 30.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

protocol BasketListTableViewCellDelegate: AnyObject {
    func didTapIncreaseButton(cell: BasketListTableViewCell)
    func didTapDecreaseButton(cell: BasketListTableViewCell)
    func didTapDeleteButton(cell: BasketListTableViewCell)
}

final class BasketListTableViewCell: UITableViewCell {
    static let identifier = "BasketListTableViewCell"
    
    var delegate: BasketListTableViewCellDelegate?
    
    private let containerView: UIView = {
        let view = UIView()
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
        imageView.image = .cofee
        return imageView
    }()
    
    private let coffeeNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: FontSize.body)
        label.text = "rgeg"
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Icons.trash), for: .normal)
        button.tintColor = .gray
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: FontSize.body)
        label.text = "frw"
        return label
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Icons.plus), for: .normal)
        button.tintColor = AppColors.ambassadorBlue.color
        return button
    }()
    
    private let removeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Icons.minus), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .boldSystemFont(ofSize: FontSize.subHeadline)
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = CGFloat.margin
        stackView.alignment = .fill
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupCoffeeImageView()
        setupCoffeeNameLabel()
        setupDeleteButton()
        setupPriceLabel()
        setUpStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(coffee: CoffeeModel, quantity: Int) {
        DispatchQueue.main.async {
            self.coffeeNameLabel.text = coffee.name
            self.coffeeImageView.kf.setImage(with: coffee.imageURL.asUrl)
            self.priceLabel.text = "\(Double(quantity) * coffee.price)₺"
            
            self.quantityLabel.text = "\(quantity)"
            
            if quantity <= 1 {
                self.removeButton.isEnabled = false
                self.removeButton.tintColor = .gray
            } else {
                self.removeButton.isEnabled = true
                self.removeButton.tintColor = .darkGray
            }
        }
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(coffeeImageView)
        containerView.addSubview(coffeeNameLabel)
        containerView.addSubview(deleteButton)
        containerView.addSubview(priceLabel)
        
        stackView = UIStackView(arrangedSubviews:
                                    [removeButton, quantityLabel, addButton])
        
        containerView.addSubview(stackView)
        
        addButton.addTarget(self,
                            action: #selector(increaseButtonTapped),
                            for: .touchUpInside)
        
        removeButton.addTarget(self,
                               action: #selector(decreaseButtonTapped),
                               for: .touchUpInside)
        
        deleteButton.addTarget(self,
                               action: #selector(deleteButtonTapped),
                               for: .touchUpInside)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(CGFloat.margin)
        }
    }
}

extension BasketListTableViewCell {
    private func setupCoffeeImageView() {
        coffeeImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(CGFloat.padding)
            make.width.equalTo(80)
            make.height.equalTo(85)
        }
    }
    
    private func setupCoffeeNameLabel() {
        coffeeNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.padding)
            make.leading.equalTo(coffeeImageView.snp.trailing).offset(2 * CGFloat.padding)
        }
    }
    
    private func setupDeleteButton() {
        deleteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(CGFloat.padding)
            make.trailing.equalToSuperview().offset(-3 * CGFloat.padding)
        }
    }
    
    private func setupPriceLabel() {
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(deleteButton.snp.bottom).offset(3 * CGFloat.margin)
            make.trailing.equalTo(deleteButton)
        }
    }
    
    private func setUpStackView() {
        stackView.snp.makeConstraints { make in
            make.leading.equalTo(coffeeNameLabel)
            make.top.equalTo(coffeeNameLabel.snp.bottom).offset(2 * CGFloat.padding)
        }
    }
}


extension BasketListTableViewCell {
    @objc func increaseButtonTapped() {
        delegate?.didTapIncreaseButton(cell: self)
    }
    
    @objc func decreaseButtonTapped() {
        delegate?.didTapDecreaseButton(cell: self)
    }
    
    @objc func deleteButtonTapped() {
        delegate?.didTapDeleteButton(cell: self)
    }
}
