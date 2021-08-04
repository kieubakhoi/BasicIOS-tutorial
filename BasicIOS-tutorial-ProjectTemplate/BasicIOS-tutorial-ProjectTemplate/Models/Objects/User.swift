//
//  User.swift
//  BasicIOS-tutorial-ProjectTemplate
//
//  Created by Apple on 04/08/2021.
//

import Foundation

final class User {
    var name: String
    var age: Int
    var gender: Bool
    
    init(name: String, age: Int, gender: Bool) {
        self.name = name
        self.age = age
        self.gender = gender
    }
}
