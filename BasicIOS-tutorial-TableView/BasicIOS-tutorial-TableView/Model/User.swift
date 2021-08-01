//
//  User.swift
//  BasicIOS-tutorial-TableView
//
//  Created by Apple on 31/07/2021.
//

import Foundation
final class User {
    var name: String
    var age: Int = 0
    var gender: Bool
    init(name: String, age: Int, gender: Bool) {
        self.name = name
        self.age = age
        self.gender = gender
    }
    
    func getSubTitle() -> String {
        return "\(gender ? "Male": "Female")- \(age) years old"
    }
//    func getUser() -> [User] {
//        // make ojbect User
//        var users  = [User]()
//        // use loop and make value for users
//        for i in 0...30 {
//            let user = User(name: "Name\(i+1)", age: Int.random(in: 10...30), gender: Bool.random())
//            // add user to users array
//            users.append(user)
//        }
//        return users
//    }
}
