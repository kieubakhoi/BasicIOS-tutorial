//
//  NormalCreateShapeView.swift
//  BasicIOS-tutorial-day3
//
//  Created by Apple on 29/07/2021.
//

import UIKit

class NormalCreateShapeView: UIView {
    var  path = UIBezierPath()
    override func draw(_ rect: CGRect) {
        let rectangleDraw  = createRectangle()
        // fill
        let fillColor = UIColor.black
        fillColor.setFill()
        rectangleDraw.fill()
        let triangle = createTriangle()
        let fillTriangle = UIColor.white
        fillTriangle.setFill()
        triangle.fill()
        
//        // Create an oval shape path.
//        self.path = UIBezierPath(ovalIn: self.bounds)
//        // Create cilcle
//        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 -  self.frame.size.height/2,
//                                                y: 0.0,
//                                                width: self.frame.size.height,
//                                                height: self.frame.size.height))
        
        // Create Arcs
//        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
//                            radius: self.frame.size.height/2,
//                            startAngle: CGFloat(180.0).toRadians(),
//                            endAngle: CGFloat(0.0).toRadians(),
//                            clockwise: true)
    }
    func createRectangle()-> UIBezierPath {
        //Inittliaze the path
        path = UIBezierPath()
        // create the point that the path should start drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        //create a line between the starting point and the bottom-left side og the view
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        //Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        //Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x:self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
        return path
    }
    
    func createTriangle ()->UIBezierPath {
        //Inittliaze the path
        path = UIBezierPath()
        
        path.move(to: CGPoint(x: self.frame.size.height/2, y: 0.0))
        
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        return path
    }
    
}
