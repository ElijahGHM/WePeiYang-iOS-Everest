//
//  NoticeViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/18.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
// 通知列表

class NoticeViewController: UIViewController {
    var noticeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    // 设置tableView
    func setTableView() {
        noticeTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        // examTableView.separatorStyle = .none // 去掉系统分割线
        view.addSubview(noticeTableView)
        noticeTableView.delegate = self
        noticeTableView.dataSource = self
    }
}
extension NoticeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return AnswerNoticeTableViewCell(index: indexPath.row)
        //  return RecruitmentInfoTableViewCell(recruitmentInfo: recruitmentInfo, index: indexPath.row, isSearch: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        UIViewController.current()!.navigationController?.pushViewController(NoticeDetailViewController(), animated: true)
        noticeTableView.deselectRow(at: indexPath, animated: false)
    }
}
