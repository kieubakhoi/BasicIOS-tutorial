//
//  FirstViewController.swift
//  BasicIOS-tutorial-NavigationController
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First View Controller"
        // add Left Buttons
        let leftButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftAction))
        let leftButton2 = UIBarButtonItem(title: "Left2", style: .plain, target: self, action: #selector(leftAction))
        navigationItem.leftBarButtonItems = [leftButton, leftButton2]
        
        // add Right Button
        let searcIcon = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(rightAction))
        let folderIcon = UIBarButtonItem(image: UIImage(named: "folder"),style: .plain, target: self, action: #selector(rightAction))
        navigationItem.rightBarButtonItems = [searcIcon, folderIcon]
        // Do any additional setup after loading the view.
    }
    @objc func leftAction(){
        print("Left Button in First View")
    }
    @objc func rightAction() {
        print("Right Button in First View")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("This is viewWillDisappear's First View Controller")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("This is viewDidDisappear's First View Controlelr")
    }


    @IBAction func pushButton(_ sender: Any) {
        let vc = SecondViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
