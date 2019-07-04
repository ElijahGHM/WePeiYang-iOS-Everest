//
//  TestViewTableViewCell.swift
//  Test1
//
//  Created by Elijah on 5/18/19.
//  Copyright © 2019 Elijah. All rights reserved.
//

import Foundation
import UIKit

class TestViewTableViewCell: UITableViewCell {
    let titleLable = UILabel()
    let Lable = UILabel()
    let pointLable = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "TestViewTableViewCell")
       
        titleLable.frame = CGRect(x: 20, y: 20, width: 150, height: 20)
        titleLable.textColor = .newBlue
        titleLable.text = "这是标题"
        contentView.addSubview(titleLable)
        
        pointLable.frame = CGRect(x: 0, y: 20, width: 20, height: 20)
        pointLable.textColor = .newBlue
        pointLable.text = "●"
        contentView.addSubview(pointLable)

        
        Lable.frame = CGRect(x: 20, y: 60, width: 300, height: 20)
        Lable.text = "等待接口"
        contentView.addSubview(Lable)
        
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
