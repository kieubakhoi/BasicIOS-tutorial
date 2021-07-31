//
//  UserView.swift
//  example-ios-day2
//
//  Created by Apple on 28/07/2021.
//

import UIKit

protocol UserViewDelegate {
    func didTap(view: UserView, count: Int)
}
class UserView: UIView {
    var count = 0
    var delegate: UserViewDelegate?
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func tap(_ sender: Any) {
        count += 1
        nameLabel.text = "\(count)"
        
        if let delegate = delegate {
            delegate.didTap(view: self, count: count)
        }
    }
}
