//
//  BaseViewController.swift
//  BasicIOS-tutorial-Connect-Networking
//
//  Created by Apple on 03/08/2021.
//

import UIKit

class BaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: setup UI and Data
    func setupUI() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back",
                                                                        style: .plain,
                                                                        target: nil,
                                                                        action: nil)
    }
    func setupData() {
        
    }
    
    
}
