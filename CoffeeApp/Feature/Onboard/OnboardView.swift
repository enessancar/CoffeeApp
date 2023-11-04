//
//  OnboardView.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 29.10.2023.
//

import UIKit
import SnapKit

protocol OnboardViewProtocol {
    func didTapStartButton()
}

final class OnboardView: UIView {
    
    var delegate: OnboardViewProtocol?
    
    //MARK: - Properties
    private lazy var onboardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .onboard
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var onboardTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.text = StringConstants.General.appName
        return label
    }()
    
    private lazy var onboardDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstants.General.discoverText
        label.font = .preferredFont(forTextStyle: .headline)
        label.numberOfLines = .zero
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startedButton = CustomButton(title: StringConstants.General.getStarted)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupOnboardImageView()
        setupOnboardTitleLabel()
        setupOnboardDescriptionLabel()
        setupStartedButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupOnboardImageView() {
        addSubview(onboardImageView)
        onboardImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(400)
        }
    }
    
    private func setupOnboardTitleLabel() {
        addSubview(onboardTitleLabel)
        onboardTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardImageView.snp.bottom).offset(2 * CGFloat.margin)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupOnboardDescriptionLabel() {
        addSubview(onboardDescriptionLabel)
        onboardDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(onboardTitleLabel.snp.bottom).offset(2 * CGFloat.margin)
            make.leading.equalToSuperview().offset(CGFloat.margin)
            make.trailing.equalToSuperview().offset(-CGFloat.margin)
        }
    }
    
    private func setupStartedButton() {
        addSubview(startedButton)
        startedButton.addTarget(self, action: #selector(startedButtonTapped), for: .touchUpInside)
        
        startedButton.snp.makeConstraints { make in
            make.top.equalTo(onboardDescriptionLabel.snp.bottom).offset(3 * CGFloat.margin)
            make.height.equalTo(ButtonSize.medium.rawValue)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
    }
}

extension OnboardView {
    @objc
    private func startedButtonTapped() {
        delegate?.didTapStartButton()
    }
}
