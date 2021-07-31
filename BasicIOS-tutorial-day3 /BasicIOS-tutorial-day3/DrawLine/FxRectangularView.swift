//
//  FxRectangularView.swift
//  BasicIOS-tutorial-day3
//
//  Created by Apple on 29/07/2021.
//

import UIKit

class FxRectangularView: UIView {
    override func draw(_ rect: CGRect) {
        // create path
        let path = createPath()
        
        //fill
        let fillColor = UIColor.orange
        fillColor.setFill()
        path.fill()
    }
    func createPath() ->UIBezierPath {
        let path = UIBezierPath(rect: self.bounds)
        return path
    }
}
