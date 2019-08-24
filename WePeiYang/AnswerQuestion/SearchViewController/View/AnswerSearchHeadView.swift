//
//  AnswerSearchViewCell.swift
//  WePeiYang
//
//  Created by Elijah on 8/20/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class SearchViewHeadView: UIView {
    let timeLabel = UILabel()
    let typeLabel = UILabel()
    let bikaoButton = UIButton()
    let xuankaoButton = UIButton()
    let jinxingButton = UIButton()
    let bukaoButton = UIButton()
    let jijiangButton = UIButton()
    let jieshuButton = UIButton()
    let padding = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let array = [timeLabel, typeLabel, bikaoButton, xuankaoButton, jinxingButton, bukaoButton, jijiangButton, jieshuButton]
        for index in 0 ..< array.count {
            self.addSubview(array[index])
        }
        self.setUI()
    }
    func setUI() {
        timeLabel.snp.makeConstraints{ make in
            make.top.equalTo(padding)
            make.left.equalTo(padding)
        }
        timeLabel.text = "选择类型:"
        timeLabel.numberOfLines = 1
        timeLabel.font = UIFont.systemFont(ofSize: 14)
        
        typeLabel.snp.makeConstraints{ make in
            make.top.equalTo(timeLabel.snp.bottom).offset(padding)
            make.left.equalTo(timeLabel.snp.left)
        }
        typeLabel.text = "选择时间"
        typeLabel.numberOfLines = 1
        typeLabel.font = UIFont.systemFont(ofSize: 14)
        
        bikaoButton.snp.makeConstraints{ make in
            make.top.equalTo(timeLabel.snp.top)
            make.left.equalTo(timeLabel.snp.right).offset(padding)
            make.bottom.equalTo(timeLabel.snp.bottom)
        }
        bikaoButton.setTitle("必考", for: .normal)
        bikaoButton.clipsToBounds = true
        bikaoButton.layer.cornerRadius = 10
        bikaoButton.layer.borderWidth = 1
        
        xuankaoButton.snp.makeConstraints{ make in
            make.top.equalTo(timeLabel.snp.top)
            make.left.equalTo(bikaoButton.snp.right).offset(padding)
            make.bottom.equalTo(timeLabel.snp.bottom)
        }
        xuankaoButton.setTitle("选考", for: .normal)
        xuankaoButton.clipsToBounds = true
        xuankaoButton.layer.cornerRadius = 10
        xuankaoButton.layer.borderWidth = 1
        
        jinxingButton.snp.makeConstraints{ make in
            make.top.equalTo(typeLabel.snp.top)
            make.left.equalTo(typeLabel.snp.right).offset(padding)
            make.bottom.equalTo(typeLabel.snp.bottom)
        }
        jinxingButton.setTitle("正在进行", for: .normal)
        jinxingButton.clipsToBounds = true
        jinxingButton.layer.cornerRadius = 10
        jinxingButton.layer.borderWidth = 1

        
        bukaoButton.snp.makeConstraints{ make in
            make.top.equalTo(typeLabel.snp.top)
            make.left.equalTo(jinxingButton.snp.right).offset(padding)
            make.bottom.equalTo(typeLabel.snp.bottom)
        }
        bukaoButton.setTitle("正在补考", for: .normal)
        bukaoButton.clipsToBounds = true
        bukaoButton.layer.cornerRadius = 10
        bukaoButton.layer.borderWidth = 1

        
        jijiangButton.snp.makeConstraints{ make in
            make.top.equalTo(typeLabel.snp.top)
            make.left.equalTo(bukaoButton.snp.right).offset(padding)
            make.bottom.equalTo(typeLabel.snp.bottom)
        }
        jijiangButton.setTitle("正在补考", for: .normal)
        jijiangButton.clipsToBounds = true
        jijiangButton.layer.cornerRadius = 10
        jijiangButton.layer.borderWidth = 1
        
        jieshuButton.snp.makeConstraints{ make in
            make.top.equalTo(typeLabel.snp.top)
            make.left.equalTo(jijiangButton.snp.right).offset(padding)
            make.bottom.equalTo(typeLabel.snp.bottom)
        }
        jieshuButton.setTitle("正在补考", for: .normal)
        jieshuButton.clipsToBounds = true
        jieshuButton.layer.cornerRadius = 10
        jieshuButton.layer.borderWidth = 1

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
