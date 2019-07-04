//
//  AnswerMyInfoTopView.swift
//  WePeiYang
//
//  Created by Elijah on 7/1/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit

class AnswerMyInfoTopView: UIView {
    let myPhoto = UIImageView()
    let accountLabel = UILabel()
    let nameLabel = UILabel()
    let IDLabel = UILabel()
    let stringArray = ["账户: \("天外天外天外天")", "姓名: \("张三")", "学号: \(3018000001)"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        self.addSubview(myPhoto)
        self.addSubview(accountLabel)
        self.addSubview(nameLabel)
        self.addSubview(IDLabel)
        }
    
    func setUI() {
        myPhoto.frame = CGRect (x: 50, y: 45, width: 60 , height: 60)
        myPhoto.image = #imageLiteral(resourceName: "个人中心")
        
        accountLabel.frame = CGRect(x: Device.width - 250, y: 20, width: 200, height: 30)
        nameLabel.frame = CGRect(x: Device.width - 250, y:55, width: 200, height: 30)
        IDLabel.frame = CGRect(x: Device.width - 250, y: 90, width: 200, height: 30)
        
        let array = [accountLabel, nameLabel, IDLabel]
        for i in 0..<3 {
            let str = stringArray[i]
            let attrStr = NSMutableAttributedString.init(string: str)
            attrStr.addAttribute(NSAttributedStringKey.foregroundColor, value:UIColor.black, range:NSRange.init(location:0, length: 3))
            attrStr.addAttribute(NSAttributedStringKey.foregroundColor, value:UIColor.blue, range:NSRange.init(location:3, length: stringArray[i].characters.count - 3))
            array[i].attributedText = attrStr
        }

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
