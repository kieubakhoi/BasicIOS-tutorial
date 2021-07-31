//
//  ThirdViewController.swift
//  BasicIOS-tutorial-NavigationController
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Third View"
    }
    
    // back to custom, here is First View is chosen
    @IBAction func popButton(_ sender: Any) {
        let vc = (self.navigationController?.viewControllers[0])!
        self.navigationController?.popToViewController(vc, animated: true)
        
        // This is to back the final View, means is first View that is showed in the first times
        self.navigationController?.popToRootViewController(animated: true)
    }
}
