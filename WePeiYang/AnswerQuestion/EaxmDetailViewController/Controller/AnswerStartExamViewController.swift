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

class AnswerStartExamViewController: UIViewController {
    let examTableView = UITableView(frame: .zero, style: .grouped)
    let bottomButton = UIButton()
    let footButton = UIButton()
    let popView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpTableView()
        setUpNavigation()
        setUpButtons()
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
//        examTableView.isPagingEnabled = true
        
        examTableView.snp.makeConstraints{ make in
            make.top.equalTo(-36)
            make.bottom.equalTo(-50)
            make.left.equalTo(20)
            make.right.equalTo(-20)
        }
    }
    // - MARK: 设置 navigation 属性
    func setUpNavigation() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "提交", style: .plain, target: self, action: #selector(tijiao))
        self.navigationController?.navigationBar.isTranslucent = false

    }
    // - MARK: 设置 button 功能
    @objc func tijiao(item: UIButton) {
        let alert = UIAlertController(title: "提示", message: "你将结束考试", preferredStyle: .alert)
        
        let subButton = UIAlertAction(title: "确认", style: .default, handler: self.sub)
        let cancelButton = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(subButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    @objc func pop(item: UIButton) {
        let window = UIApplication.shared.keyWindow
        popView.frame = window!.bounds
        popView.backgroundColor = UIColor(white: 1 , alpha: 0.1)
        window?.addSubview(popView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(chehui))
        popView.addGestureRecognizer(gesture)
    }
    func sub(alert: UIAlertAction) {
//        print("开始考试")
        navigationController?.pushViewController(AnswerMyInfoViewController(), animated: true)
    }
    @objc func chehui(item: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.popView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.55)
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.popView.removeFromSuperview()
                
            }
        }
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath[1] == 0) {
            let cell = ExamDetailTableViewSingleCell()
            cell.selectionStyle = .none
            cell.backgroundColor = .backgroundBlue
            cell.numLabel.text = "\(indexPath[1] + 1). "
            return cell
        } else {
            let cell = ExamDetailTableViewMultipleCell()
            cell.selectionStyle = .none
            cell.backgroundColor = .backgroundBlue
            cell.numLabel.text = "\(indexPath[1] + 1). "
            return cell

        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return examTableView.height / 2
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
