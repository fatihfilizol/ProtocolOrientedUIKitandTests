//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Fatih Filizol on 18.11.2022.
//

import UIKit

class UserViewController: UIViewController, UserViewvModelProtocol {
    func updateView(name: String, userName: String, email: String) {
        self.nameLabel.text = name
        self.userNameLabel.text = userName
        self.emailLabel.text = email
    }
    
    
    private let viewModel : UserViewModel
    
    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.viewModel.output = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        //fetchUsers()
        viewModel.fetchUsers()
    }
    
    func setupViews () {
        view.backgroundColor = .systemCyan
        
        view.addSubview(nameLabel)
        view.addSubview(userNameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
        
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            userNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 60),
            userNameLabel.widthAnchor.constraint(equalToConstant: 200),
            userNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
        
        ])
        
        nameLabel.text = "Name Label"
        emailLabel.text = "Email Label"
        userNameLabel.text = "User Name Label"
    }

    /*
    private func fetchUsers() {
        APIManager.shared.fetchUser { result in
            switch result {
            case .success(let user):
                self.userNameLabel.text = user.username
                self.nameLabel.text = user.name
                self.emailLabel.text = user.email
            case .failure:
                self.nameLabel.text = "User is not found"
            }
        }
    }
*/
}

