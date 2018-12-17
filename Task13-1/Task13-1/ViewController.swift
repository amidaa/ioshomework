//
//  ViewController.swift
//  Task13-1
//
//  Created by student on 2018/12/12.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sumlable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sumbutton(_ sender: Any) {
        DispatchQueue.global().async {
            var sum=0
            for i in 1...9999999{
                sum += i
            }
            DispatchQueue.main.async {
                self.sumlable.text = "sum=\(sum)"
            }
        }
       
    }
    
}

