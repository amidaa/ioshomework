//
//  ViewController.swift
//  TaskNine
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //   显示ActionSheet并进行交互；
    @IBAction func actionsheet(_ sender: Any) {
        let alert = UIAlertController(title: "action sheet", message: "this is an action sheet", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "red", style: .default, handler: {(action) in print("ok,clicked")
            self.view.backgroundColor = UIColor.red
        }))
        alert.addAction(UIAlertAction(title: "green", style: .destructive, handler: {(action) in print("destructive clicked")
            self.view.backgroundColor = UIColor.green
        }))
        alert.addAction(UIAlertAction(title: "white", style: .cancel, handler: {(action) in print("cancle clicked")
            self.view.backgroundColor = UIColor.white
        }))
        present(alert,animated: true,completion: nil)
    }
    //  显示Login Alert并进行交互
    @IBAction func AlertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Login", message: "this is an alert", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: {(action) in  if let nameTextFiled = alert.textFields?.first,let passwordTextFiled = alert.textFields?.last{
            print("username\(nameTextFiled.text!) and your password is \(passwordTextFiled.text!)")
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancle", style: .cancel, handler: {(action) in }))
        alert.addTextField{(textField) in textField.placeholder = "please input your username"}
        alert.addTextField{(textField) in textField.placeholder = "please input your password"
            textField.isSecureTextEntry = true
        }
        present(alert,animated: true,completion: nil)
    }
    
}

