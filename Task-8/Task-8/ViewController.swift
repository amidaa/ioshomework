//
//  ViewController.swift
//  Task-8
//
//  Created by student on 2018/10/31.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var chooselable: UILabel!
    var stuArry = [Student]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stuArry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:StudentTableViewCell!
    //    if indexPath.row%2 == 0{
      //       cell = (tableView.dequeueReusableCell(withIdentifier: "studentcell") as! StudentTableViewCell)
     //   }else{
     //        cell = (tableView.dequeueReusableCell(withIdentifier: "studentcell") as! StudentTableViewCell)
     //   }
        cell = (tableView.dequeueReusableCell(withIdentifier: "studentcell") as! StudentTableViewCell)
       
        let stu = stuArry[indexPath.row]
        cell.name.text = stu.fullName
        cell.age.text = "\(stu.age)"
        cell.grade.text = "\(stu.age)"
        cell.gender.text = "\(stu.gender)"
        cell.pic.image = UIImage(named: "photo")
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stuArry.append( Student(firstName:"lin",lastName:"qian",age:21,gender:Gender.female,stuNo:"201711452"))
        stuArry.append( Student(firstName:"zhao",lastName:"qiang",age:21,gender:Gender.male,stuNo:"201711434"))
        stuArry.append( Student(firstName:"sun",lastName:"yu",age:21,gender:Gender.female,stuNo:"201711412"))
        
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chooselable.text = "you choose :\(stuArry[indexPath.row])"
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            stuArry.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
   func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let name = stuArry.remove(at: sourceIndexPath.row)
        stuArry.insert(name, at: destinationIndexPath.row)
    }

    @IBAction func addClicked(_ sender: Any) {
        if let name = nameText.text{
            stuArry.append(Student(firstName:name,lastName:"",age:21,gender:Gender.female,stuNo:"201711452"))
            tableView.reloadData()
            nameText.resignFirstResponder()
        }
    }
    @IBAction func editClicked(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
}

