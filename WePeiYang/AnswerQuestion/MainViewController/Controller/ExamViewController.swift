//
//  ExamViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/18.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
// 考试列表

class ExamViewController: UIViewController {
    
    var examTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        
    }
    // 设置tableView
    func setTableView() {
        examTableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height), style: .plain)
        // examTableView.separatorStyle = .none // 去掉系统分割线
        view.addSubview(examTableView)
        examTableView.delegate = self
        examTableView.dataSource = self
    }
}
extension ExamViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return AnswerExamTableViewCell(index: indexPath.row)
      //  return RecruitmentInfoTableViewCell(recruitmentInfo: recruitmentInfo, index: indexPath.row, isSearch: false)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIViewController.current()!.navigationController?.pushViewController(ExamDetailViewController(), animated: true)
        examTableView.deselectRow(at: indexPath, animated: false)
    }
}
extension UIViewController {
    class func current(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return current(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return current(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return current(base: presented)
        }
        return base
    }
//    func table open override var inputView: UIView?
//    
}
