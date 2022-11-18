//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Fatih Filizol on 18.11.2022.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var sut : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelProtocol!

    override func setUpWithError() throws {
        userService = MockUserService()
        sut = UserViewModel(userService: userService)
        output = MockUserViewModelProtocol()
        sut.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        sut = nil
    }

    func testUpdateView_whenAPISuccess_showsEmailNameUserName() throws {
        let mockUser = User(id: 1, name: "Fatih", username: "fatihfilizol", email: "fatih@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        sut.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "fatihfilizol")
        
    }
    func testUpdateView_whenAPIFailure_showsNoUser() throws {
        userService.fetchUserMockResult = .failure(NSError())
        sut.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.name, "No User")
        
    }

}


class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, Error>?
    func fetchUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult{
            completion(result)
        }
    }
    
    
}


class MockUserViewModelProtocol : UserViewvModelProtocol{
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    func updateView(name: String, userName: String, email: String) {
        updateViewArray.append((name,email,userName))
    }
    
    
}
