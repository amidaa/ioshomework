//
//  SecondViewController.swift
//  TaskEleven-1
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
var name = ""
var psw = ""
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord:UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = name
        passWord.text = psw

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        name = userName.text!
        psw = passWord.text!
    }

}
