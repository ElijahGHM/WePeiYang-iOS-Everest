//
//  AnswerMyInfoTableViewCell.swift
//  WePeiYang
//
//  Created by Elijah on 7/1/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
class AnswerMyInfoTableViewCell: UITableViewCell {
    
    let biKaoLable = UILabel()
    let jinXingLable = UILabel()
    let titleLable = UILabel()
    let timeLable = UILabel()
    let gradeHeadLabel = UILabel()
    let gradeLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let array = [biKaoLable, jinXingLable, titleLable, timeLable, gradeHeadLabel, gradeLabel]
        for index in 0 ..< array.count {
            addSubview(array[index])
        }
    }
    
    convenience init() {
        self.init(style: .default, reuseIdentifier: "AnswerMyInfoTableViewCell")

        
        let padding: CGFloat = 20
        
        biKaoLable.frame = CGRect(x: padding, y: padding, width: Device.width/11, height: 20)
        biKaoLable.text = "必考"
        biKaoLable.font = UIFont.systemFont(ofSize: 12)
        biKaoLable.textAlignment = .center
        biKaoLable.textColor = .blue
        biKaoLable.clipsToBounds = true
        biKaoLable.layer.cornerRadius = 10
        biKaoLable.layer.borderWidth = 1
        biKaoLable.layer.borderColor = UIColor.blue.cgColor
        
        jinXingLable.frame = CGRect(x: padding, y: biKaoLable.frame.maxY + 10, width: Device.width/7, height: 20)
        jinXingLable.text = "正在进行"
        jinXingLable.font = UIFont.systemFont(ofSize: 12)
        jinXingLable.textAlignment = .center
        jinXingLable.textColor = .red
        jinXingLable.clipsToBounds = true
        jinXingLable.layer.cornerRadius = 10
        jinXingLable.layer.borderWidth = 1
        jinXingLable.layer.borderColor = UIColor.red.cgColor
        
        titleLable.frame = CGRect(x: biKaoLable.frame.maxX + 10, y: padding-3, width: Device.width/2, height: 26)
        titleLable.text = "形势与政策第三十七期 "
        titleLable.font = UIFont.systemFont(ofSize: 18)
        titleLable.textAlignment = .left
        titleLable.textColor = .black
        
        timeLable.frame = CGRect(x: jinXingLable.frame.maxX + 10, y: jinXingLable.y-3, width: Device.width/2, height: 26)
        timeLable.text = "2019.04.29 - 2019.05.01"
        timeLable.font = UIFont.systemFont(ofSize: 14)
        timeLable.textAlignment = .left
        timeLable.textColor = .gray
        
        gradeHeadLabel.snp.makeConstraints { make in
            make.right.equalTo(-5)
            make.top.equalTo(padding)
        }
        gradeHeadLabel.text = "当前最高分"
        gradeHeadLabel.font = UIFont.systemFont(ofSize: 17)
        gradeHeadLabel.textColor = .black
        gradeHeadLabel.textAlignment = .center
        
        gradeLabel.snp.makeConstraints{ make in
            make.top.equalTo(gradeHeadLabel).offset(25)
            make.centerX.equalTo(gradeHeadLabel).offset(gradeHeadLabel.center.x)
        }
        gradeLabel.text = "98"
        gradeLabel.font = UIFont.systemFont(ofSize:28)
        gradeLabel.textColor = .blue
        gradeLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
