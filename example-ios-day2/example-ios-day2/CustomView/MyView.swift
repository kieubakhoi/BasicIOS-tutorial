//
//  MyView.swift
//  example-ios-day2
//
//  Created by Apple on 28/07/2021.
//

import UIKit

class MyView: UIView {
    var avartarImageView: UIImageView?
    var nameLabel: UILabel?
    var makeButton: UIButton?
    var count = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        // add user avatar
        avartarImageView = UIImageView(image: UIImage(named: "no_avatar"))
        avartarImageView!.frame = CGRect(x: 0,
                                  y: 0,
                                  width: frame.size.width,
                                  height: frame.size.height*4/5)
        avartarImageView!.contentMode = .scaleAspectFit
        self.addSubview(avartarImageView!)
               
       // add user name
        nameLabel = UILabel(frame: CGRect(x: 0,
                                             y: frame.size.height*4/5,
                                             width: frame.size.width,
                                             height: frame.size.height/5))
        nameLabel!.text = "Fx Studio"
        nameLabel!.backgroundColor = .lightGray
        nameLabel!.textAlignment = .center
        nameLabel!.textColor = .blue
        self.addSubview(nameLabel!)
               
        // add button
        makeButton = UIButton(frame: CGRect(x: 0,
                                            y: 0,
                                            width: frame.size.width,
                                            height: frame.size.height))
        makeButton!.backgroundColor = .clear
        makeButton?.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.addSubview(makeButton!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func tap (){
        count += 1
        nameLabel?.text = "\(count)"
    }
}
