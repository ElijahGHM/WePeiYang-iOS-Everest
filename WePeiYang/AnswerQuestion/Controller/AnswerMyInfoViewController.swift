//
//  AnswerMyInfoViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/26.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
class AnswerMyInfoViewController: UIViewController {
    let mytableView = UITableView(frame: .zero, style: .grouped)
    let topView = AnswerMyInfoTopView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "个人页面"
        self.view.backgroundColor = .white
        view.backgroundColor = .white
        
        setTableView()
        
    }
    func setTableView() {
        topView.frame = CGRect(x: 10, y: 0, width: Device.width - 20, height: 150)
        topView.backgroundColor = .white
        mytableView.frame = CGRect(x: 22, y: 0, width: Device.width - 44, height: Device.height)
        mytableView.backgroundColor = .white
        mytableView.delegate = self
        mytableView.dataSource = self
        mytableView.bounces = false
        mytableView.alwaysBounceVertical = false
        mytableView.tableHeaderView = topView
        mytableView.tableHeaderView?.clipsToBounds = true
        mytableView.tableHeaderView?.layer.cornerRadius = 10
        mytableView.tableHeaderView?.layer.borderWidth = 1
        mytableView.tableHeaderView?.layer.borderColor = UIColor(red: 236/255, green: 236/255, blue: 236/255, alpha: 1.0).cgColor
        mytableView.reloadData()
        
        view.addSubview(mytableView)

    }
    
}
extension AnswerMyInfoViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AnswerMyInfoTableViewCell()
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 106
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let myView = AnswerMyInfoSectionView()
        myView.backgroundColor = .white
        return myView
    }
}
