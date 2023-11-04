//
//  DiscoverTableViewCell.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 30.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class DiscoverTableViewCell: UITableViewCell {
    static let identifier = "DiscoverTableViewCell"
    
    //MARK: - Properties
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
    
    private var postImageView: UIImageView = {
        let imageview = UIImageView()
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.layer.cornerRadius = Radius.medium.rawValue
        return imageview
    }()
    
    private var postDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: FontSize.body)
        return label
    }()
    
    private var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: FontSize.body)
        return label
    }()
    
    private let userInfoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Radius.medium.rawValue
        view.backgroundColor = AppColors.discoverUserView.color
        return view
    }()
    
    private var postAddedDateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: FontSize.body)
        return label
    }()
    
    private let userProfileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.image = .defaultProfile
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        setupPostImageView()
        setupUserInfoView()
        setupUserProfileImage()
        setupUsernameLabel()
        setupPostDescriptionLabel()
        setupPostDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureCell(post: PostModel, user: UserModel) {
        postImageView.kf.setImage(with: post.imageURL.asUrl)
        userProfileImage.kf.setImage(with: user.profileImageURL.asUrl)
        
        userNameLabel.text = user.name
        postDescriptionLabel.text = post.desctiption
        postAddedDateLabel.text = post.creationDate.timeAgoDisplay()
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        
        containerView.addSubview(postImageView)
        containerView.addSubview(userInfoView)
        
        userInfoView.addSubview(userProfileImage)
        userInfoView.addSubview(userNameLabel)
        userInfoView.addSubview(postDescriptionLabel)
        userInfoView.addSubview(postAddedDateLabel)
        
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    private func setupPostImageView() {
        postImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(CGFloat.padding)
            make.trailing.equalToSuperview().offset(-CGFloat.padding)
        }
    }
    
    private func setupUserInfoView() {
        userInfoView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(-3 * CGFloat.margin)
            make.leading.equalToSuperview().offset(CGFloat.padding / 2)
            make.trailing.equalToSuperview().offset(-CGFloat.padding / 2)
            make.height.equalTo(5 * CGFloat.margin)
        }
    }
    
    private func setupUserProfileImage() {
        userProfileImage.snp.makeConstraints { make in
            make.height.width.equalTo(4 * CGFloat.margin)
            make.centerY.equalTo(userInfoView.snp.centerY)
            make.leading.equalToSuperview().offset(CGFloat.margin)
        }
    }
    
    private func setupUsernameLabel() {
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(userProfileImage.snp.top)
            make.leading.equalTo(userProfileImage.snp.trailing).offset(CGFloat.padding)
        }
    }
    
    private func setupPostDescriptionLabel() {
        postDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(userNameLabel.snp.bottom).offset(CGFloat.padding)
            make.leading.equalTo(userNameLabel)
            make.bottom.equalToSuperview().offset(-CGFloat.padding / 2)
        }
    }
    
    private func setupPostDateLabel() {
        postAddedDateLabel.snp.makeConstraints { make in
            make.centerY.equalTo(userProfileImage)
            make.trailing.equalToSuperview().offset(-CGFloat.margin)
        }
    }
}
