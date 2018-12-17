//
//  JOSNViewController.swift
//  Task13-3
//
//  Created by student on 2018/12/13.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit
import Alamofire

class JOSNViewController: UIViewController {
    let url = URL(fileURLWithPath: "http://t.weather.sojson.com/api/weather/city/101270101")
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loadWithJosn(_ sender: Any) {
        AF.request(url).responseJSON{
            (response) in
            let josn = response.value as! [[String:String]]
            self.per
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
