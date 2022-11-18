//
//  UserViewModelProtocol.swift
//  ProtocolOrientedUIKit
//
//  Created by Fatih Filizol on 18.11.2022.
//

import Foundation

protocol UserViewvModelProtocol : AnyObject{
    func updateView (name: String, userName:String, email: String)
}
