//
//  Student.swift
//  Task-8
//
//  Created by student on 2018/10/31.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import Foundation
enum Gender{
    case male
    case female
}
class Person:CustomStringConvertible{
    var firstName:String
    var lastName:String
    var age:Int
    var gender:Gender
    var fullName:String{
        get{
            return firstName+lastName
        }
        
    }
    init(){
        self.firstName = ""
        self.lastName = ""
        self.age = 0
        self.gender = Gender.male
    }
    //构造函数
    init(firstName:String,lastName:String,age:Int,gender:Gender){
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.gender = gender
        
    }
    //便利构造函数
    convenience init(name:String){
        self.init(firstName:name,lastName:"",age:20,gender:Gender.male)
    }
    //输出Person类
    var description:String{
        return "Name\(fullName) Age\(age) Gender\(gender)"
    }
    
}
//两个Person实例对象可以用==和!=进行比较,重载==和!=
func ==(a:Person,b:Person)->Bool{
    return a.fullName == b.fullName&&a.age == b.age&&a.gender == b.gender
}
func !=(a:Person,b:Person)->Bool{
    return a.fullName != b.fullName || a.age != b.age || a.gender != b.gender
}
class Teacher:Person{
    var title:String
    //构造函数
    init (firstName:String,lastName:String,age:Int,gender:Gender,title:String){
        self.title = title
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    //重写构造函数
    override init(){
        title=""
        super.init()
    }
    override var description:String{
        return "Name\(fullName) Age\(age) Gender\(gender) Title\(title)"
    }
    
}
class Student:Person{
    var stuNo:String
    init(firstName:String,lastName:String,age:Int,gender:Gender,stuNo:String){
        self.stuNo = stuNo
        super.init(firstName:firstName,lastName:lastName,age:age,gender:gender)
    }
    override var description:String{
        return "Name\(fullName) Age\(age) Gender\(gender) stuNo\(stuNo)"
    }
}
var p1=Person(firstName:"zhang",lastName:"feng",age:20,gender:Gender.female)
var p2=Person(firstName:"li",lastName:"hong",age:18,gender:Gender.female)
var p3=Person(firstName:"zhou",lastName:"lei",age:19,gender:Gender.male)
var t1=Teacher(firstName:"liu",lastName:"xiang",age:21,gender:Gender.male,title:"Chinese")
var t2=Teacher(firstName:"song",lastName:"shan",age:21,gender:Gender.female,title:"English")
var t3=Teacher(firstName:"lin",lastName:"ling",age:21,gender:Gender.female,title:"Math")
var s1=Student(firstName:"lin",lastName:"qian",age:21,gender:Gender.female,stuNo:"201711452")
var s2=Student(firstName:"zhao",lastName:"qiang",age:21,gender:Gender.male,stuNo:"201711434")
var s3=Student(firstName:"sun",lastName:"yu",age:21,gender:Gender.female,stuNo:"201711412")
