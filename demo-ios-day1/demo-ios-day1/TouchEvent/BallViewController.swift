//
//  BallViewController.swift
//  demo-ios-day1
//
//  Created by Apple on 28/07/2021.
//

import UIKit

class BallViewController: UIViewController {

    @IBOutlet weak var ball: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            if touch.view == ball {
                let location = touch.location(in: view)
                ball.center = location
            }
        }
    }


}
