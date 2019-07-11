//
//  AnswerNoticeTableViewCell.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/21.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
class AnswerNoticeTableViewCell: UITableViewCell {
    
    let pointLabel = UILabel()
    let titleLable = UILabel()
    let timeLable = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let array = [pointLabel, titleLable, timeLable]
        for index in 0..<array.count {
            contentView.addSubview(array[index])
        }
    }
    
    convenience init(index: Int) {
        self.init(style: .default, reuseIdentifier: "AnswerNoticeTableViewCell")
        
        let padding: CGFloat = 20
        pointLabel.snp.makeConstraints{ make in
            make.top.equalTo(padding)
            make.left.equalTo(padding + 3)
        }
        pointLabel.textColor = .newBlue
        pointLabel.text = "●"
        
        titleLable.snp.makeConstraints{ make in
            make.top.equalTo(padding - 3)
            make.left.equalTo(pointLabel.snp.right).offset(5)
            make.height.equalTo(26)
        }
        titleLable.text = "关于进行第三十七期理论答题的通知"
        titleLable.font = UIFont.systemFont(ofSize: 16)
        titleLable.textAlignment = .left
        titleLable.textColor = .black
        
        timeLable.snp.makeConstraints{ make in
            make.top.equalTo(titleLable.snp.bottom)
            make.left.equalTo(titleLable.snp.left)
            make.height.equalTo(26)
        }
        timeLable.text = "2019.04.29"
        timeLable.font = UIFont.systemFont(ofSize: 14)
        timeLable.textAlignment = .left
        timeLable.textColor = .gray
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
