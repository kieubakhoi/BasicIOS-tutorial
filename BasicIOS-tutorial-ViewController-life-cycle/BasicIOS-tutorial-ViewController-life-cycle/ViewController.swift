//
//  ViewController.swift
//  BasicIOS-tutorial-ViewController-life-cycle
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class ViewController: UIViewController {
    // Too short, but to understand, must be work so much
    override func viewDidLoad() {
        super.viewDidLoad()
        print("🔵 viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("😆 viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("😆 viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("🤣 viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("😊 viewDidDisappear")
    }


}

