//
//  ExamDetailViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/18.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
// 考试详情界面

class ExamDetailViewController: UIViewController {
    let myTableView = UITableView(frame: .zero, style: .plain)
    let footButton = UIButton(frame: CGRect(x: 44, y: 100, width: Device.width, height: 36))
    let tableViewCellTitles  = ["考试名称", "考试时间", "历史最高分", "通过状态", "有效成绩次数", "剩余考试次数"]
    let tableViewCellContents = ["形势与政策第三十七期", "201904..29-2019.05.05", "59", "未通过", "0次", "10次"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "考试详情"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.view.backgroundColor = .white
        footButton.backgroundColor = .newBlue
        footButton.setTitle("开始考试", for: .normal)
        footButton.layer.cornerRadius = 4
        footButton.addTarget(self, action: #selector(ExamDetailViewController.click), for: .touchUpInside)
        loadTableView()
    }
    func loadTableView() {
        myTableView.frame = CGRect(x: 22, y: 0, width: Device.width - 44, height: 800)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.isScrollEnabled = false // 不可滑动
        
        view.addSubview(myTableView)
    }
    @objc func click(button: UIButton) {
        let alert = UIAlertController(title: "提示", message: "你将开始考试", preferredStyle: .alert)
        
        let subButton = UIAlertAction(title: "确认", style: .default, handler: self.sub)
        let cancelButton = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(subButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true, completion: nil)
    }
    func sub(alert: UIAlertAction) {
        print("开始考试")
        navigationController?.pushViewController(AnswerStartExamViewController(), animated: true)
    }
}
extension UIColor {
    static var newBlue: UIColor {
        return UIColor(red: 62/255, green: 129/255, blue: 228/255, alpha: 1.0)
    }
    static var backgroundBlue: UIColor {
        return UIColor(red: 246/255, green: 248/255, blue: 254/255, alpha: 1.0)
    }
}

extension ExamDetailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension ExamDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TestViewTableViewCell()
        cell.selectionStyle = UITableViewCell.SelectionStyle.none//cell不可被点击
        cell.titleLable.text = tableViewCellTitles[indexPath.row]
        cell.Lable.text = tableViewCellContents[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return footButton
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 36
    }
    
}
