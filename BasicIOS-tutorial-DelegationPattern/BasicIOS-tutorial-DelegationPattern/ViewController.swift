//
//  ViewController.swift
//  BasicIOS-tutorial-DelegationPattern
//
//  Created by Apple on 30/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userView = Bundle.main.loadNibNamed("UserView", owner: self, options: nil)?.first as! UserView
        userView.frame = CGRect(x: 50, y: 150, width: 100, height: 125)
        userView.index = 10
        userView.delegate = self
        userView.dataSource = self
        
        view.addSubview(userView)
        userView.config()
    }
}

extension ViewController: UserViewDelegate {
    func userView(userView: UserView, didSelectedWith index: Int) {
        print("Did select UserView with index: 10")
    }
}

extension ViewController: UserViewDataSource {
    func userView(nameOf userView: UserView) -> String {
        return "Khoi kb"    }
    
    func userView(indexOf userView: UserView) -> Int {
        return 999
    }
    
    
}

