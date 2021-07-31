//
//  FxLineView.swift
//  BasicIOS-tutorial-day3
//
//  Created by Apple on 29/07/2021.
//

import UIKit

class FxLineView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        super .init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    	
    func drawLine(start: CGPoint, end: CGPoint) {
        // make Path
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        path.close()
        
        //make layer to set size and color
        let shapeLayer = CAShapeLayer()
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 1.0
        shapeLayer.path = path.cgPath
        
        //add to view layer
        self.layer.addSublayer(shapeLayer)
    }
    

}
