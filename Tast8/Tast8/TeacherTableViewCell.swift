//
//  TeacherTableViewCell.swift
//  Tast8
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 zhangfeng. All rights reserved.
//

import UIKit

class TeacherTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var pic: UIImageView!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var age: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
