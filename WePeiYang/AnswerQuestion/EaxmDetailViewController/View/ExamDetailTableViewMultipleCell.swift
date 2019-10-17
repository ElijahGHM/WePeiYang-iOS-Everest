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
    let buttonE = UIButton()
    let buttonF = UIButton()
    let labelA = UILabel()
    let labelB = UILabel()
    let labelC = UILabel()
    let labelD = UILabel()
    let labelE = UILabel()
    let labelF = UILabel()
    let padding = 20
    var numOfQuestions = 4
    var chosenArray = Array(repeating: false, count: 6)
    static var idx = 0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        let array = [numLabel, topicLabel, buttonA, buttonB, buttonC, buttonD, buttonE, buttonF, labelA, labelB, labelC, labelD, labelE, labelF]
        for index in 0..<array.count {
            contentView.addSubview(array[index])
        }
    }
    convenience init(paper: ExamPaper, index: Int) {
        self.init(style: .default, reuseIdentifier: "ExamDetailTableViewCell")
        let paddingA = 40 //选项之间的空隙
        let paddingB = 15 //button 与 label 之间的空隙
        let length = 25 //button 的边长
        let buttonArr = [buttonA, buttonB, buttonC, buttonD, buttonE, buttonF]
        let labelArr = [labelA, labelB, labelC, labelD, labelE, labelF]
        let questionArr = [paper.body?[index].objA, paper.body?[index].objB, paper.body?[index].objC, paper.body?[index].objD, paper.body?[index].objE, paper.body?[index].objF]

        if paper.body?[index].objD == Optional("")  {
            numOfQuestions = 3
        } else if paper.body?[index].objE == Optional("") {
            numOfQuestions = 4
        } else if paper.body?[index].objF == Optional("") {
            numOfQuestions = 5
        }
        numLabel.snp.makeConstraints{ make in
            make.top.equalTo(padding)
            make.left.equalTo(padding)
            make.width.equalTo(length + 5)
            make.height.equalTo(length)
        }
        numLabel.text = "\(index + 1)"
        
        topicLabel.snp.makeConstraints{ make in
            make.top.equalTo(numLabel.snp.top)
            make.left.equalTo(numLabel.snp.right).offset(5)
            make.right.equalTo(-padding)
        }
        topicLabel.text = paper.body?[index].question
        topicLabel.numberOfLines = 0
        topicLabel.adjustsFontSizeToFitWidth = true
        topicLabel.font = numLabel.font
        for i in 0 ..< numOfQuestions {
            buttonArr[i].snp.makeConstraints{ make in
                make.top.equalTo(labelArr[i].snp.top)
                make.left.equalTo(numLabel.snp.left)
                make.height.equalTo(length)
                make.width.equalTo(length)
            }
            buttonArr[i].setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            if (paper.body?[index].type)!.rawValue == "sc" {
                buttonArr[i].addTarget(self, action: #selector(radio), for: .touchUpInside)
            } else {
                buttonArr[i].addTarget(self, action: #selector(multiple), for: .touchUpInside)
            }
            labelArr[i].snp.makeConstraints{ make in
                if i == 0 {
                    make.top.equalTo(topicLabel.snp.bottom).offset(paddingA)
                } else {
                    make.top.equalTo(labelArr[i - 1].snp.bottom).offset(paddingA)
                }
                if i == numOfQuestions - 1 {
                    make.bottom.equalToSuperview().offset(-padding)
                }
                make.left.equalTo(buttonArr[i].snp.right).offset(paddingB)
                make.right.equalTo(-padding)
            }
            labelArr[i].numberOfLines = 0
            labelArr[i].adjustsFontSizeToFitWidth = true
            labelArr[i].text = questionArr[i]
            if AnswerStartExamViewController.Answer_isDone[index] == true {
                if AnswerStartExamViewController.Answer_answerlist[ExamDetailTableViewMultipleCell.idx] == "A" {
                    buttonArr[0].setImage(#imageLiteral(resourceName: "like"), for: .normal)
                } else if AnswerStartExamViewController.Answer_answerlist[ExamDetailTableViewMultipleCell.idx] == "B" {
                    buttonArr[1].setImage(#imageLiteral(resourceName: "like"), for: .normal)
                } else if AnswerStartExamViewController.Answer_answerlist[ExamDetailTableViewMultipleCell.idx] == "C" {
                    buttonArr[2].setImage(#imageLiteral(resourceName: "like"), for: .normal)
                } else if AnswerStartExamViewController.Answer_answerlist[ExamDetailTableViewMultipleCell.idx] == "D" {
                    buttonArr[3].setImage(#imageLiteral(resourceName: "like"), for: .normal)
                }
            }
        }
    }
    @objc func radio(button: UIButton) {
        switch button {
        case self.buttonA:
            buttonA.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            buttonB.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonC.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonD.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            AnswerStartExamViewController.Answer_answerlist[AnswerStartExamViewController.Answer_index] = "A"
            AnswerStartExamViewController.Answer_isDone[AnswerStartExamViewController.Answer_index] = true
            print(AnswerStartExamViewController.Answer_answerlist)
        case self.buttonB:
            buttonB.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            buttonA.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonC.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonD.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            AnswerStartExamViewController.Answer_answerlist[AnswerStartExamViewController.Answer_index] = "B"
            AnswerStartExamViewController.Answer_isDone[AnswerStartExamViewController.Answer_index] = true
            print(AnswerStartExamViewController.Answer_answerlist)
        case self.buttonC:
            buttonC.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            buttonA.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonB.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonD.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            AnswerStartExamViewController.Answer_answerlist[AnswerStartExamViewController.Answer_index] = "C"
            AnswerStartExamViewController.Answer_isDone[AnswerStartExamViewController.Answer_index] = true
            print(AnswerStartExamViewController.Answer_answerlist)
        case self.buttonD:
            buttonD.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            buttonA.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonB.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            buttonC.setImage(#imageLiteral(resourceName: "grey_star"), for: .normal)
            AnswerStartExamViewController.Answer_answerlist[AnswerStartExamViewController.Answer_index] = "D"
            AnswerStartExamViewController.Answer_isDone[AnswerStartExamViewController.Answer_index] = true
            print(AnswerStartExamViewController.Answer_answerlist)
        default:
            break
        }
    }
    @objc func multiple(button: UIButton) {
        switch button {
        case self.buttonA:
            self.buttonA.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonA.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            chosenArray[0] = true
        case self.buttonB:
            self.buttonB.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonB.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            chosenArray[1] = true
        case self.buttonC:
            self.buttonC.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonC.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            chosenArray[2] = true
        case self.buttonD:
            self.buttonD.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonD.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            chosenArray[3] = true
        case self.buttonE:
            self.buttonE.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonE.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            chosenArray[4] = true
        case self.buttonF:
            self.buttonF.setImage(#imageLiteral(resourceName: "like"), for: .normal)
            self.buttonF.addTarget(self, action: #selector(self.canceled), for: .touchUpInside)
            chosenArray[5] = true
        default:
            break
        }
    }
    @objc func canceled(button: UIButton) {
        switch button {
        case self.buttonA:
            self.buttonA.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonA.addTarget(self, action: #selector(self.multiple), for: .touchUpInside)
            chosenArray[0] = false
        case self.buttonB:
            self.buttonB.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonB.addTarget(self, action: #selector(self.multiple), for: .touchUpInside)
            chosenArray[1] = false
        case self.buttonC:
            self.buttonC.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonC.addTarget(self, action: #selector(self.multiple), for: .touchUpInside)
            chosenArray[2] = false
        case self.buttonD:
            self.buttonD.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonD.addTarget(self, action: #selector(self.multiple), for: .touchUpInside)
            chosenArray[3] = false
        case self.buttonE:
            self.buttonE.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonE.addTarget(self, action: #selector(self.multiple), for: .touchUpInside)
            chosenArray[4] = false
        case self.buttonF:
            self.buttonF.setImage(#imageLiteral(resourceName: "star_grey"), for: .normal)
            self.buttonF.addTarget(self, action: #selector(self.multiple), for: .touchUpInside)
            chosenArray[5] = false
        default:
            break
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
