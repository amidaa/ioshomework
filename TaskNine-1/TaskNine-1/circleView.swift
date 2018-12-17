//
//  circleView.swift
//  TaskNine-1
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit
@IBDesignable
class circleView: UIView {

    @IBInspectable var color:UIColor?
    func setup(){
        
    }
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        color?.setFill()
        UIColor.yellow.setStroke()
        path.stroke()
        path.fill()
    }

}
