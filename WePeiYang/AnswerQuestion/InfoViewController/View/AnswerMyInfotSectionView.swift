//
//  AnswerMyInfotSectionView.swift
//  WePeiYang
//
//  Created by Elijah on 7/1/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit

class AnswerMyInfoSectionView: UIView {
    let myImage = UIImageView()
    let myLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(myImage)
        addSubview(myLabel)
        setUI()
    }
    
    func setUI() {
        myImage.snp.makeConstraints{ make in
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.left.equalTo(10)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        myImage.image = #imageLiteral(resourceName: "ic_arrow_right")
        
//        myLabel.frame = CGRect(x: 45, y: 10, width: 150, height: 30)
        myLabel.snp.makeConstraints{ make in
            make.left.equalTo(myImage).offset(35)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            
        }
        myLabel.text = "已参加的考试"
        myLabel.font = UIFont.boldSystemFont(ofSize: 20)
        myLabel.textColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
