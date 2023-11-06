//
//  DiscoverVC.swift
//  CoffeeApp
//
//  Created by Enes Sancar on 28.10.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class DiscoverVC: UIViewController {
    
    var allUsersWithPosts: [(user: UserModel, posts: [PostModel])] = []
    
    private lazy var navBarProfileImageView: UIBarButtonItem = {
        let profileImageView = UIImageView()
        DispatchQueue.main.async {
            if let user = AuthenticationService.shared.currentUser {
                profileImageView.kf.setImage(with: user.photoURL)
            }
        }
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.cornerRadius = 20
        profileImageView.clipsToBounds = true
        
        let containerView = UIView()
        containerView.addSubview(profileImageView)
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalTo(containerView.snp.edges)
            make.width.height.equalTo(40)
        }
        return UIBarButtonItem(customView: containerView)
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 300
        tableView.separatorStyle = .none
        tableView.isEditing = false 
        tableView.register(DiscoverTableViewCell.self,
                           forCellReuseIdentifier: DiscoverTableViewCell.identifier)
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        configureNavigationBar()
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func fetchData() {
        DataService.shared.listenToAllUsersWithPosts { result in
            switch result {
            case let .success(data):
                self.allUsersWithPosts = data
                
                self.allUsersWithPosts.sort(by: {
                    guard let date1 = $0.posts.first?.creationDate,
                          let date2 = $1.posts.first?.creationDate else {
                              return false
                    }
                    return date1 > date2
                })
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureNavigationBar() {
        navigationItem.title = StringConstants.MainTabBar.discover
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.boldSystemFont(ofSize: 20),
        ]
        navigationItem.rightBarButtonItem = navBarProfileImageView
    }
}

extension DiscoverVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allUsersWithPosts[section].posts.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        allUsersWithPosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DiscoverTableViewCell.identifier,
            for: indexPath) as? DiscoverTableViewCell else {
            fatalError()
        }
        let post = allUsersWithPosts[indexPath.section].posts[indexPath.row]
        let user = allUsersWithPosts[indexPath.section].user

        cell.configureCell(post: post, user: user)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
