//
//  ViewController.swift
//  TaskEleven-1
//
//  Created by student on 2018/12/8.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//    override func viewWillAppear(_ animated: Bool) {
//        userName.text = userDefault.string(forKey: "name")
//        passWord.text = userDefault.string(forKey: "psw")
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Second"{
            let secVC = segue.destination as!SecondViewController
            secVC.name = userName.text!
            secVC.psw = passWord.text!
            userDefault.set(userName.text!,forKey: "name")
            userDefault.set(passWord.text!,forKey: "psw")
            userDefault.synchronize()
            print(NSTemporaryDirectory())
        }
    }
    @IBAction func myback(segue:UIStoryboardSegue){
        let secVC = segue.source as! SecondViewController
        userName.text = secVC.name
        passWord.text = secVC.psw
    }
    
}

