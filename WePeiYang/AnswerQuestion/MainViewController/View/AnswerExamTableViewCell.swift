//
//  AnswerExamTableViewCell.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//
import UIKit
class AnswerExamTableViewCell: UITableViewCell {
    
    let biKaoLable = UILabel()
    let jinXingLable = UILabel()
    let titleLable = UILabel()
    let timeLable = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let array = [biKaoLable, jinXingLable, titleLable, timeLable]
        for index in 0..<array.count {
            contentView.addSubview(array[index])
        }
    }
    
    convenience init(index: Int) {
        self.init(style: .default, reuseIdentifier: "ExamTableViewCell")
        
        let padding: CGFloat = 20
        
        biKaoLable.snp.makeConstraints{ make in
            make.top.equalTo(padding)
            make.left.equalTo(padding)
            make.height.equalTo(20)
            make.width.equalTo(Device.width / 11)
        }
        biKaoLable.text = "必考"
        biKaoLable.font = UIFont.systemFont(ofSize: 12)
        biKaoLable.textAlignment = .center
        biKaoLable.textColor = .newBlue
        biKaoLable.clipsToBounds = true
        biKaoLable.layer.cornerRadius = 10
        biKaoLable.layer.borderWidth = 1
        biKaoLable.layer.borderColor = UIColor.newBlue.cgColor
        
        jinXingLable.snp.makeConstraints{ make in
            make.top.equalTo(biKaoLable.snp.bottom).offset(10)
            make.left.equalTo(padding)
            make.height.equalTo(biKaoLable.snp.height)
            make.width.equalTo(Device.width / 7)
        }
        jinXingLable.text = "正在进行"
        jinXingLable.font = UIFont.systemFont(ofSize: 12)
        jinXingLable.textAlignment = .center
        jinXingLable.textColor = .red
        jinXingLable.clipsToBounds = true
        jinXingLable.layer.cornerRadius = 10
        jinXingLable.layer.borderWidth = 1
        jinXingLable.layer.borderColor = UIColor.red.cgColor
        
        titleLable.snp.makeConstraints{ make in
            make.top.equalTo(padding - 3)
            make.left.equalTo(biKaoLable.snp.right).offset(6)
            make.height.equalTo(26)
        }
        titleLable.text = "形势与政策第三十七期 "
        titleLable.font = UIFont.systemFont(ofSize: 18)
        titleLable.textAlignment = .left
        titleLable.textColor = .black
        
        timeLable.snp.makeConstraints{ make in
            make.top.equalTo(titleLable.snp.bottom).offset(3)
            make.left.equalTo(jinXingLable.snp.right).offset(6)
            make.height.equalTo(26)
        }
        timeLable.text = "2019.04.29 - 2019.05.01"
        timeLable.font = UIFont.systemFont(ofSize: 14)
        timeLable.textAlignment = .left
        timeLable.textColor = .gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

