//
//  DemoViewController.swift
//  BasicIOS-tutorial-MVC
//
//  Created by Apple on 31/07/2021.
//

import UIKit

class DemoViewController: UIViewController {

    // outlet
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var textFieldB: UITextField!
    @IBOutlet weak var textFieldA: UITextField!
    
    // data
    var a: Float {
        get{
            return Float(textFieldA.text!) ?? 0
        }
    }
    var b: Float {
        get {
            return Float(textFieldB.text!) ?? 0
        }
    }
    var tResult: Float = 0 {
        didSet {
            result.text = "\(tResult)"
        }
    }
    //model
    var calculator = Calculator ()
    
    
    // custom Button
    @IBOutlet weak var subButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // add target for button
        subButton.addTarget(self, action: #selector(subs), for: .touchUpInside)
    }

    @IBAction func sub(_ sender: Any) {
        tResult = calculator.sub(a: self.a, b: self.b)
    }
    @IBAction func add(_ sender: Any) {
        tResult = calculator.add(a: self.a, b: self.b)
        // Ex 1
//        let a = Float(textFieldA.text!) ?? 0
//        let b = Float(textFieldB.text!) ?? 0
//
//        // make obj Calculator
//        let calculator = Calculator()
//        // let call func
//        let rs = calculator.add(a: a, b: b)
//        result.text = "\(rs)"
    }
    
    @IBAction func div(_ sender: Any) {
        tResult = calculator.div(a: self.a, b: self.b)
    }
    
    @IBAction func mul(_ sender: Any) {
        tResult = calculator.mul(a: self.a, b: self.b)
    }
    // make func
    @objc func subs() {
        print("This is sub button")
    }
}
