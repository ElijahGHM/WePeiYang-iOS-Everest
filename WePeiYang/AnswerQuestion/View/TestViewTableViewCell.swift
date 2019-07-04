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

        contentView.addSubview(pointLable)
        pointLable.snp.makeConstraints{ make in
            make.top.equalTo(20)
            make.left.equalTo(10)
        }
        pointLable.textColor = .newBlue
        pointLable.text = "●"
        
        contentView.addSubview(titleLable)
        titleLable.snp.makeConstraints{ make in
            make.top.equalTo(20)
            make.left.equalTo(pointLable.snp.right).offset(10)
            make.height.equalTo(20)
        }
        titleLable.textColor = .newBlue
        titleLable.text = "这是标题"
        
        contentView.addSubview(Lable)
        Lable.snp.makeConstraints{ make in
            make.top.equalTo(titleLable.snp.bottom).offset(10)
            make.left.equalTo(titleLable.snp.left)
        }
        Lable.text = "等待接口"
        
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
