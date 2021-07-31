//
//  ViewController.swift
//  BasicIOS-tutorial-day3
//
//  Created by Apple on 29/07/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let lineView = FxLineView(frame: view.bounds)
        lineView.drawLine(start: CGPoint(x: 50, y: 100), end: CGPoint(x: 300, y: 600))
        view.addSubview(lineView)
        
        let rectView = FxRectangularView(frame: CGRect(x: 30, y: 300, width: 350, height: 150))
        view.addSubview(rectView)
        
        // Create view by NormalCreateShapeView class
        let someView = NormalCreateShapeView(frame: CGRect(x: 40, y: 150, width: 200, height: 200))
        view.addSubview(someView)
    }


}

