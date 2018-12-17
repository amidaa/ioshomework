//
//  ViewController.swift
//  TaskNine-1
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit
//(1)    Gesture
//a)    分别采用代码随机位置大小生成和直接拖拽的方式产生多个视图；
//b)    采用简单的动画进行移动；
//c)    给视图加上阴影(layer)；
//d)    可全部清空子视图；
//e)    视图支持手势（pan移动、tap删除、pinch缩放、rotation旋转）；
//提示：Pinch的scale属性可用于调整frame
//rotation需要用transform属性实现

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let uiImageview = UIImageView(frame: CGRect(x: 200, y: 200, width: 50, height: 50))
        let image = UIImage(named: "smile")
        uiImageview.image = image
        view.addSubview(uiImageview)
        
    }

    @IBAction func addClicked(_ sender: Any) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        let uiImageview = UIImageView(frame: CGRect(x: x, y: y, width: 50, height: 50))
        let image = UIImage(named: "smile")
        uiImageview.image = image
        uiImageview.layer.shadowColor = UIColor.gray.cgColor
        uiImageview.layer.shadowOffset = CGSize(width: 10, height: 10)
        uiImageview.layer.opacity = 1
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer: )))
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.view.addSubview(uiImageview)
        uiImageview.addGestureRecognizer(panRecognizer)
        uiImageview.addGestureRecognizer(tapRecognizer)
        uiImageview.isUserInteractionEnabled = true
        tapRecognizer.numberOfTapsRequired  = 2
        
    }
    @objc func pan(recognizer:UIPanGestureRecognizer){
        switch recognizer.state {
        case .changed: fallthrough
        case .ended:
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        default:
            break
        }
    }
    @objc func tap(recognizer:UIPanGestureRecognizer){
        if recognizer.state == .recognized{
            recognizer.view?.removeFromSuperview()
        }
    }
    
    @IBAction func move(_ sender: Any) {
        for sview in self.view.subviews{
            if sview is UIImageView{
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random())%Int(self.view.bounds.width)
                    let y = Int(arc4random())%Int(self.view.bounds.height)
                    sview.center = CGPoint(x: x, y: y)
                }
            }
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        for my_view in self.view.subviews{
            if my_view is UIImageView{
                my_view.removeFromSuperview()
            }
        }
        
    }
}

