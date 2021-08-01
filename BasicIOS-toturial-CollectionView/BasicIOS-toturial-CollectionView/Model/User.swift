//
//  User.swift
//  BasicIOS-toturial-CollectionView
//
//  Created by Apple on 01/08/2021.
//

import Foundation

final class User {
    var name: String
    var avatar: String
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
extension User {
    static func getDummyDatas() -> [User]{
        var users: [User] = []
        
        for i in 1...30 {
            let user = User(name: "User\(i)", avatar: "Image")
            users.append(user)
        }
        return users
    }
}
