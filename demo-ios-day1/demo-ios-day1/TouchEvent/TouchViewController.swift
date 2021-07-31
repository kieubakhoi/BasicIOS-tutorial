//
//  TouchViewController.swift
//  demo-ios-day1
//
//  Created by Apple on 28/07/2021.
//

import UIKit

class TouchViewController: UIViewController {
    @IBOutlet weak var blueView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            if let touch = touches.first {
                let currentPointOfView = touch.location(in: view)
                print("View point(\(currentPointOfView.x), \(currentPointOfView.y))")
                
                let currentPointOfBlueView = touch.location(in: blueView)
                print("BlueView point(\(currentPointOfBlueView.x), \(currentPointOfBlueView.y))")
            }
        
            //check point of view or not
            if let touch = touches.first {
                
                if touch.view == blueView {
                    print("inside BlueView")
                } else {	
                    print("outside BlueView")
                }
            }
        }

}
