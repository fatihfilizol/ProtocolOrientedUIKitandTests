//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Fatih Filizol on 18.11.2022.
//

import Foundation

protocol UserService {
    func fetchUser(completion: @escaping(Result<User,Error>) -> Void)
}
