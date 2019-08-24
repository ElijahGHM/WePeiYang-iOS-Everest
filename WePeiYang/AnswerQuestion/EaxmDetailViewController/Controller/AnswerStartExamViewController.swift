//
//  AnswerStartExamViewController.swift
//  WePeiYang
//
//  Created by Elijah on 7/9/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
// 考试界面

class AnswerStartExamViewController: UIViewController {
    let examTableView = UITableView(frame: .zero, style: .grouped)
    let bottomButton = UIButton()
    let footButton = UIButton()
    let popView = UIView()
    let cardView = ExamCardCollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var exampaper: ExamPaper!

    override func viewDidLoad() {
        super.viewDidLoad()
        getPaperHelper.getpaper(success: { paper in
            self.exampaper = paper
            self.setUpTableView()
            self.setUpNavigation()
            self.setUpButtons()
        }, failure: { _ in
        })
        view.backgroundColor = .white
        }
    
    // - MARK: 设置 tableview 属性
    func setUpTableView() {
        view.addSubview(examTableView)
        examTableView.dataSource = self
        examTableView.delegate = self
        examTableView.backgroundColor = .white
        examTableView.bounces = false
        examTableView.showsVerticalScrollIndicator = false
        examTableView.showsHorizontalScrollIndicator = false
        examTableView.estimatedRowHeight = 300.0 // 估算 cell 的初始高度
        examTableView.rowHeight = UITableViewAutomaticDimension // 使 cell 自动调整高度
        examTableView.snp.makeConstraints{ make in
            make.top.equalTo(-36)
            make.bottom.equalTo(-50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
        cardView.frame = CGRect(x: 0, y: Device.height + 30, width: Device.width, height: Device.height * 0.45)
        view.addSubview(cardView)
    }
    // - MARK: 设置 navigation 属性
    func setUpNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .plain, target: self, action: #selector(tijiao))
        self.navigationController?.navigationBar.isTranslucent = false
        let item = UIBarButtonItem(title: "", style: .done, target: self, action: #selector(click))
        self.navigationItem.backBarButtonItem = item

    }
    // - MARK: 设置 button 功能
    @objc func click(item: UIButton) {
        if let vcs = navigationController?.viewControllers {
            if (vcs.count - 3) >= 0 {
                navigationController?.popToViewController(vcs[vcs.count - 4], animated: true)
            } else {
                navigationController?.popToViewController(vcs[vcs.count - 2], animated: true)
            }
        }
    }
    @objc func tijiao(item: UIButton) {
        let alert = UIAlertController(title: "提示", message: "你将结束考试", preferredStyle: .alert)
        
        let subButton = UIAlertAction(title: "确认", style: .default, handler: self.sub)
        let cancelButton = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(subButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    @objc func pop(item: UIButton) {
        bottomButton.setImage(#imageLiteral(resourceName: "ic_arrow_down"), for: .normal)
        bottomButton.addTarget(self, action: #selector(chehui), for: .touchUpInside)
        
        UIView.animate(withDuration: 0.5) {
            self.cardView.frame = CGRect(x: 0, y: 0.55 * deviceHeight - 50, width: deviceWidth, height: 0.45 * deviceHeight)
            print("动画效果")

        }
    }
    func sub(alert: UIAlertAction) {
        navigationController?.pushViewController(AnswerMyInfoViewController(), animated: true)
    }
    @objc func chehui(item: UIButton) {
        UIView.animate(withDuration: 0.3) {
            // 尾随闭包播放弹出动画
            self.cardView.frame = CGRect(x: 0, y: deviceHeight + 30, width: deviceWidth, height: 0.45 * deviceHeight)
            
        }
        bottomButton.setImage(#imageLiteral(resourceName: "ic_arrow_up"), for: .normal)
        bottomButton.addTarget(self, action: #selector(pop), for: .touchUpInside)
    }
    // - MARK: 设置底端 button 功能
    func setUpButtons() {
        view.addSubview(bottomButton)
        bottomButton.snp.makeConstraints{ make in
            make.top.equalTo(examTableView.snp.bottom)
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        bottomButton.setTitle("题卡", for: .normal)
        bottomButton.setTitleColor(.newBlue, for: .normal)
        bottomButton.backgroundColor = .white
        bottomButton.setImage(#imageLiteral(resourceName: "ic_arrow_up"), for: .normal)
        bottomButton.addTarget(self, action: #selector(pop), for: .touchUpInside)
        
        
    }
}
extension AnswerStartExamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (exampaper.body?.count)!
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExamDetailTableViewMultipleCell(paper: exampaper, index: indexPath.row)
        cell.selectionStyle = .none
        cell.backgroundColor = .backgroundBlue
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView()
        footView.backgroundColor = .white
        footView.addSubview(footButton)
        footButton.snp.makeConstraints{ make in
            make.top.equalTo(20)
            make.height.equalTo(50)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        footButton.backgroundColor = .newBlue
        footButton.setTitle("提交答案", for: .normal)
        footButton.layer.cornerRadius = 4
        footButton.addTarget(self, action: #selector(tijiao), for: .touchUpInside)
        return footView
    }
}
