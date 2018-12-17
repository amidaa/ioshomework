//
//  ViewController.swift
//  animation
//
//  Created by student on 2018/11/21.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//声明物理动画
    lazy var animator = UIDynamicAnimator(referenceView:  self.backView)
//    设置重力和碰撞
    let grivaty = UIGravityBehavior()
    let collision = UICollisionBehavior()
    @IBOutlet weak var backView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(grivaty)
        animator.addBehavior(collision)
        collision.translatesReferenceBoundsIntoBoundary = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addItem(_ sender: Any) {
        let width = Int(backView.bounds.width/10)
        let randomx =  Int(arc4random()%10)*width
        let lable = UILabel(frame: CGRect(x: randomx, y: 20, width: 40, height: 40))
        lable.text=" 红包"
        lable.textColor = UIColor.white
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.red
        backView.addSubview(lable)
        grivaty.addItem(lable)
        collision.addItem(lable)
    }
    //通过设置重力方向来改变重力
    @IBAction func up(_ sender: Any) {
        grivaty.gravityDirection = CGVector(dx: 0, dy: 1)
        
    }
    @IBAction func down(_ sender: Any) {
        grivaty.gravityDirection = CGVector(dx: 0, dy: -1)
        
    }
    @IBAction func left(_ sender: Any) {
        grivaty.gravityDirection = CGVector(dx: -1, dy: 0)
        
    }
    @IBAction func right(_ sender: Any) {
        grivaty.gravityDirection = CGVector(dx: 1, dy: 0)
        
    }
    @IBAction func deleted(_ sender: Any) {
        for item in backView.subviews{
            if item is UILabel{
                item.removeFromSuperview()
//                清除相应的重力和碰撞
                grivaty.removeItem(item)
                collision.removeItem(item)
            }
        }
        
    }
}

