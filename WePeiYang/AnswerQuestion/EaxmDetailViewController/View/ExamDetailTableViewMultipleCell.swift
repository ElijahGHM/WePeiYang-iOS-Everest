//
//  ExamDetailTableViewMultipleCell.swift
//  WePeiYang
//
//  Created by Elijah on 7/9/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class ExamDetailTableViewMultipleCell: UITableViewCell {
    let numLabel = UILabel()
    let topicLabel = UILabel()
    let buttonA = UIButton()
    let buttonB = UIButton()
    let buttonC = UIButton()
    let buttonD = UIButton()
    let labelA = UILabel()
    let labelB = UILabel()
    let labelC = UILabel()
    let labelD = UILabel()
    let padding = 20

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let array = [numLabel, topicLabel, buttonA, buttonB, buttonC, buttonD, labelA, labelB, labelC, labelD]
        for index in 0..<array.count {
            contentView.addSubview(array[index])
        }
    }
    convenience init() {
        self.init(style: .default, reuseIdentifier: "ExamDetailTableViewCell")
        let paddingA = 40 //选项之间的空隙
        let paddingB = 15 //button 与 label 之间的空隙
        let length = 25 //button 的边长
        numLabel.snp.makeConstraints{ make in
            make.top.equalTo(padding)
            make.left.equalTo(padding)
        }
        
        topicLabel.snp.makeConstraints{ make in
            make.top.equalTo(numLabel.snp.top)
            make.left.equalTo(numLabel.snp.right).offset(5)
        }
        topicLabel.text = "这是题目(多选)"
        
        buttonA.snp.makeConstraints{ make in
            make.top.equalTo(numLabel.snp.bottom).offset(paddingA)
            make.left.equalTo(numLabel.snp.left)
            make.height.equalTo(length)
            make.width.equalTo(length)
        }
        buttonA.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
        buttonA.addTarget(self, action: #selector(selected), for: .touchUpInside)
        
        labelA.snp.makeConstraints{ make in
            make.top.equalTo(buttonA.snp.top)
            make.left.equalTo(buttonA.snp.right).offset(paddingB)
        }
        labelA.text = "题目 A"
        
        buttonB.snp.makeConstraints{ make in
            make.top.equalTo(buttonA.snp.bottom).offset(paddingA)
            make.left.equalTo(buttonA.snp.left)
            make.height.equalTo(length)
            make.width.equalTo(length)
            
        }
        buttonB.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
        buttonB.addTarget(self, action: #selector(selected), for: .touchUpInside)
        
        
        labelB.snp.makeConstraints{ make in
            make.top.equalTo(buttonB.snp.top)
            make.left.equalTo(buttonB.snp.right).offset(paddingB)
        }
        labelB.text = "题目 B"
        
        buttonC.snp.makeConstraints{ make in
            make.top.equalTo(buttonB.snp.bottom).offset(paddingA)
            make.left.equalTo(buttonB.snp.left)
            make.height.equalTo(length)
            make.width.equalTo(length)
            
        }
        buttonC.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
        buttonC.addTarget(self, action: #selector(selected), for: .touchUpInside)
        
        
        labelC.snp.makeConstraints{ make in
            make.top.equalTo(buttonC.snp.top)
            make.left.equalTo(buttonC.snp.right).offset(paddingB)
        }
        labelC.text = "题目 C"
        
        buttonD.snp.makeConstraints{ make in
            make.top.equalTo(buttonC.snp.bottom).offset(paddingA)
            make.left.equalTo(buttonC.snp.left)
            make.height.equalTo(length)
            make.width.equalTo(length)
            
        }
        buttonD.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
        buttonD.addTarget(self, action: #selector(selected), for: .touchUpInside)
        
        
        labelD.snp.makeConstraints{ make in
            make.top.equalTo(buttonD.snp.top)
            make.left.equalTo(buttonD.snp.right).offset(paddingB)
        }
        labelD.text = "题目 D"
        
    }
    @objc func selected(button: UIButton) {
        switch button {
        case self.buttonA:
            self.buttonA.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonA.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
        case self.buttonB:
            self.buttonB.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonB.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
        case self.buttonC:
            self.buttonC.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonC.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
        case self.buttonD:
            self.buttonD.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonD.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            self.buttonD.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            
        default:
            break
        }
    }
    @objc func canceled(button: UIButton) {
        switch button {
        case self.buttonA:
            self.buttonA.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonA.addTarget(self, action: #selector(self.selected), for: .touchUpInside)
        case self.buttonB:
            self.buttonB.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonB.addTarget(self, action: #selector(self.selected), for: .touchUpInside)
        case self.buttonC:
            self.buttonC.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonC.addTarget(self, action: #selector(self.selected), for: .touchUpInside)
        case self.buttonD:
            self.buttonD.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonD.addTarget(self, action: #selector(self.selected), for: .touchUpInside)
            
        default:
            break
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
