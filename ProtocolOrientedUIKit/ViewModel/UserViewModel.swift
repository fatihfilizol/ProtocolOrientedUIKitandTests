//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Fatih Filizol on 18.11.2022.
//

import Foundation



class UserViewModel {
    private let userService : UserService
    weak var output : UserViewvModelProtocol?

    init(userService:UserService){
        self.userService = userService
    }
    
    func fetchUsers () {
        userService.fetchUser { [weak self]result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, userName: user.username, email: user.email)
            case .failure(_):
                self?.output?.updateView(name: "No User", userName: "" , email: "")            }
        }
    }
}
