//
//  SecondViewController.swift
//  BasicIOS-tutorial-NavigationController
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Second View Controller"
    }
    // Push to Third View Controller
    @IBAction func pusButton(_ sender: Any) {
        let vc = ThirdViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    // This is to back the first View
    @IBAction func PopButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
