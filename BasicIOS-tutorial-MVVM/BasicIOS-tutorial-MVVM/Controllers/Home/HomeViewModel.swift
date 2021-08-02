//
//  HomeViewModel.swift
//  BasicIOS-tutorial-MVVM
//
//  Created by Apple on 02/08/2021.
//

import Foundation

class HomeViewModel {
    var email: String = ""
    var password: String = ""
    func fetchData(completion: (Bool, String, String) -> ()) {
        let data = DataManager.shared().read()
        let email = data.0
        let password = data.1
        
        if email != "" || password != "" {
            // save data
            self.email = email
            self.password = password
            
            // call back
            completion(true, email, password)
        } else {
            // call back
            completion(false, "", "")
        }
    }
}
