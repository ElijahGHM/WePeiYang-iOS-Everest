//
//  AnswerNoticeTableViewCell.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/21.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
class AnswerNoticeTableViewCell: UITableViewCell {
    
    let pointImageView = UIImageView()
    let titleLable = UILabel()
    let timeLable = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init(index: Int) {
        self.init(style: .default, reuseIdentifier: "AnswerNoticeTableViewCell")
        
        let padding: CGFloat = 20
        pointImageView.frame = CGRect(x: padding, y: padding+3, width: 10, height: 10)
        pointImageView.layer.cornerRadius = pointImageView.frame.width/2
        pointImageView.backgroundColor = .black
        contentView.addSubview(pointImageView)
        
        titleLable.frame = CGRect(x: pointImageView.frame.maxX + 10, y: padding-3, width: Device.width*3/4, height: 26)
        titleLable.text = "关于进行第三十七期理论答题的通知"
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.textAlignment = .left
        titleLable.textColor = .black
        contentView.addSubview(titleLable)
        
        timeLable.frame = CGRect(x: titleLable.x, y: titleLable.frame.maxY+10, width: Device.width/2, height: 26)
        timeLable.text = "2019.04.29"
        timeLable.font = UIFont.systemFont(ofSize: 14)
        timeLable.textAlignment = .left
        timeLable.textColor = .gray
        contentView.addSubview(timeLable)

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
