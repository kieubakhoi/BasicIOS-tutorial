//
//  UserView.swift
//  BasicIOS-tutorial-DelegationPattern
//
//  Created by Apple on 30/07/2021.
//

import UIKit

protocol UserViewDelegate: class {
    func userView(userView: UserView, didSelectedWith index: Int)
}
protocol UserViewDataSource: class{
    func userView(nameOf userView: UserView)->String
    func userView(indexOf userView: UserView)-> Int
    
}
class UserView: UIView {
    weak var delegate: UserViewDelegate?
    weak var dataSource: UserViewDataSource?
    var index: Int = 0
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imgEx: UIImageView!
//    @IBAction func tap(_ sender: Any) {
//        if let delegate = delegate {
//            delegate.userView(userView: self, didSelectedWith: index)
//        }
//    }
    func config() {
        if let dataSource = dataSource {
            // set index
            index = dataSource.userView(indexOf: self)
            
            //set name
            title.text = dataSource.userView(nameOf: self)
        }
    }
}



