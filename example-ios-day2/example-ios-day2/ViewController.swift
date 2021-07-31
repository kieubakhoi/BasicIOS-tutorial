//
//  ViewController.swift
//  example-ios-day2
//
//  Created by Apple on 28/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let hamster = MyView(frame: CGRect(x: 50, y: 100, width: 100, height: 125))
        hamster.nameLabel?.text = "hamster"
        hamster.avartarImageView?.image = UIImage(named: "hamster")
        view.addSubview(hamster)
        
        let husky = MyView(frame: CGRect(x: 200, y: 100, width: 100, height: 125))
        husky.nameLabel?.text = "husky"
        husky.avartarImageView?.image = UIImage(named: "husky")
        view.addSubview(husky)
        
        // make User View by LoadNibName
        let userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as? UserView
        userView?.frame = CGRect(x: 50, y: 250, width: 100, height: 125)
        userView?.delegate = self
        view.addSubview(userView!)
    }


}
extension ViewController: UserViewDelegate {
    func didTap(view: UserView, count: Int) {
        print("Count: \(count)")
    }
}

