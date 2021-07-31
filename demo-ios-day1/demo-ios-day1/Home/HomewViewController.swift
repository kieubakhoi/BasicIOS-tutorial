//
//  HomewViewController.swift
//  demo-ios-day1
//
//  Created by Apple on 27/07/2021.
//

import UIKit

class HomewViewController: UIViewController {

    @IBOutlet var titleLabels: [UILabel]!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var titleLogo: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set title Logo
        titleLogo.text = "Khoi kb"
        
        //        fill index to collection
        for index in 0..<titleLabels.count {
            titleLabels[index].text = "Title Labels \(index)"
            //        }
            // Do any additional setup after loading the view.
            let frame = CGRect(x: 50, y: 100, width: 100, height: 100)
            let userAvatar = UIImageView(image: UIImage(named: "person"))
            userAvatar.frame = frame
            userAvatar.contentMode = .scaleToFill
            view.addSubview(userAvatar)
            
            // add user name
            let userName = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 25))
            userName.text = "Fx Studio"
            userName.backgroundColor = .lightGray
            userName.textAlignment = .center
            userName.textColor = .blue
            view.addSubview(userName)
            
            // add button
            let button = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 225))
            button.backgroundColor = .clear
            button.addTarget(self, action: #selector(tap), for: .touchDragInside)
            view.addSubview(button)
        }
    }
    
    @objc func tap() {
        print("tap tap tap")
    }

    @IBAction func tapButton(_ sender: Any) {
        print("Tap !!!")
    }
}
