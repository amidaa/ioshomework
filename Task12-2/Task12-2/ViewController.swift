//
//  ViewController.swift
//  Task12-2
//
//  Created by student on 2018/12/15.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit
import SQLite3
class ViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfGender: UITextField!
    let db =  SQLiteDB.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        let result = db.open(dbPath: "", copyFile: true)
        print("result:\(result)")
        let r = db.execute(sql: "create table if not exists person(name varchar(20),age varchar(2),gender varchar(5))")
        print(r)
        print(NSHomeDirectory())
        print(Bundle.main.bundlePath)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func add(_ sender: Any) {
         let r = db.execute(sql: "insert into person(name,age ,gender)values('\(tfName.text!)','\(tfAge.text!)','\(tfGender.text!)')")
        print("result:\(r)")
    }

    @IBAction func update(_ sender: Any) {
         let r = db.execute(sql: "update person set age = '\(tfAge.text!)' where name = '\(tfName.text!)'")
        print("result:\(r)")
    }
    @IBAction func deletedata(_ sender: Any) {
        let r = db.execute(sql: "delete from person where name = '\(tfName.text!)'")
         print("result:\(r)")

    }
    @IBAction func queryDate(_ sender: Any) {
        let persons = db.query(sql: "select * from person where name = '\( tfName.text!)'")

        if let person = persons.first,let age = person["age"] as? String,let gender = person["gender"] as? String{
            tfAge.text = age
            tfGender.text = gender
        }
    }
}

