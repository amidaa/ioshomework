//
//  ViewController.swift
//  single view
//
//  Created by student on 2018/10/24.
//  Copyright © 2018年 zhangfeng. All rights reserved.
///Users/student/Documents/zf/single view/single view/Base.lproj/Main.storyboard

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let redview = UIView()
        redview.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        let blueview = UIView()
        blueview.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        let yellowview = UIView()
        yellowview.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        let stackview = UIStackView(arrangedSubviews: [redview,blueview,yellowview])
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fillEqually
        stackview.spacing = 20
        
        
        view.addSubview(stackview)
        stackview.translatesAutoresizingMaskIntoConstraints = false
   stackview.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant:20).isActive = true
     stackview.topAnchor.constraint(equalTo:view.topAnchor,constant:20).isActive = true
   stackview.trailingAnchor.constraint(equalTo:view.trailingAnchor,constant:-20).isActive = true
   stackview.bottomAnchor.constraint(equalTo:view.bottomAnchor,constant:-20).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

