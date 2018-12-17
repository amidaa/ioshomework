//
//  ViewController.swift
//  Timer
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var MyView: UIView!
    @IBOutlet weak var SecondView: UIView!
    var timer:Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:{[weak weakSelf = self](mytimer) in weakSelf?.MyView.center.x+=20} )
    }
    @IBAction func btnClicked(_ sender: Any) {
        //停止timer
//        timer?.invalidate()
//        UIView.transition(with: MyView, duration: 2, options: .transitionFlipFromTop, animations:{ self.MyView.backgroundColor = UIColor.blue}, completion: nil)
        //(1)    基于UIView.animation实现如下动画效果：
        //a)    改变视图的位置
        //b)    改变视图的大小
        //c)    改变视图的transform
        
        UIView.animate(withDuration: 4, delay: 0, options: [.curveEaseInOut,.repeat,.autoreverse], animations: {
            self.MyView.center.x = self.view.bounds.width
        })
        UIView.animate(withDuration: 4, delay: 0, options: [.curveEaseInOut,.repeat,.autoreverse], animations: {
            self.MyView.alpha = 0
            self.MyView.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
            CGAffineTransform(rotationAngle: CGFloat(Double.pi)).scaledBy(x: 0.5, y: 0.5)
        }){(finished) in
            if finished {
                self.MyView.removeFromSuperview()
            }
        }
       
    }
    //(2)    基于UIView.transition实现如下动画效果：
    //a)    改变视图的背景颜色；
    //b)    切换两个子视图，观察切换后视图层次的变化情况；
    
    @IBAction func transtionBtn(_ sender: Any) {
//        if let firstview = MyView.subviews.first{
//            let secondview = UIView(frame: CGRect(x: 20, y: 20, width: 40, height: 60))
//            secondview.backgroundColor = UIColor.yellow
//            UIView.transition(from: firstview, to: secondview, duration: 2, options: .curveLinear, completion: nil)
//
//        }
        let imageView = UIImageView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        imageView.image = UIImage(named: "image")
        UIView.transition(from: MyView, to: imageView, duration: 2, options: .curveLinear, completion: nil)
        
    }
}

