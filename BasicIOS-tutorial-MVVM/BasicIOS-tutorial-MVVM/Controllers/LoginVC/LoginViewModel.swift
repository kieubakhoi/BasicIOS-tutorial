//
//  LoginViewModel.swift
//  BasicIOS-tutorial-MVVM
//
//  Created by Apple on 02/08/2021.
//

import Foundation


final class LoginViewModel {
    //MARK: enum
    enum LoginResult {
        case success
        case failure(Bool, String)
    }
    //MARK: typelias
    typealias Completion = (LoginResult) -> Void
    
    //MARK: - properties
    var email: String
    var password: String

    
    init(email: String, password: String) {
            self.email = email
            self.password = password
    }
    //MARK: - Actions
    func login(email: String, password: String, completion: Completion) {
        if email == "" || password == "" {
            //call back
            completion(.failure(true, "Mat khau hoac email rong !!!"))
            
        } else {
            // update value
            self.email = ""
            self.password = ""
            
            //save Data
            DataManager.shared().save(email: email, password: password)
            //call back
            completion(.success)
        }
    }
    

}
