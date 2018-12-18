//
//  firstUIviewController.swift
//  HelloWold
//
//  Created by student on 2018/10/17.
//

import UIKit

class firstUIviewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        let lable = UILabel(frame: CGRect(x: 200, y: 100, width: 100, height: 50))
        lable.text = "hello world"
        lable.textAlignment = .center
        lable.backgroundColor = UIColor.cyan
        lable.center = view.center
        view.addSubview(lable)
        let button = UIButton(frame: CGRect(x: 150, y: 100, width: 100, height: 100))
        button.setTitle("click me", for: .normal)
        button.setTitleColor(UIColor.yellow, for: .normal)
        view.addSubview(button)
        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    @IBAction func btnClicked(){
        if let lable = view.subviews.first as? UILabel{
            lable.text = "I am clicked!"
        }
        self.navigationController?.pushViewController(SecondUIViewController(), animated: true)
    }
   
}
