//
//  HomeViewController.swift
//  BasicIOS-tutorial-MVVM
//
//  Created by Apple on 02/08/2021.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel = HomeViewModel()
    @IBOutlet weak var emailLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        fetchData()
    }
    func updateUI(){
        emailLabel.text = viewModel.email
    }
    
    func fetchData() {
        viewModel.fetchData{(done, email, password) in
            if done {
                self.updateUI()
            } else {
                print("Loi")
            }
        }
    }
}
