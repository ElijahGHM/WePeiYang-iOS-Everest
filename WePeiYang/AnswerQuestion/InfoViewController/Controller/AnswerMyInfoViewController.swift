//
//  AnswerMyInfoViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/26.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
// 个人界面

class AnswerMyInfoViewController: UIViewController {
    let mytableView = UITableView(frame: .zero, style: .grouped)
    let topView = AnswerMyInfoTopView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "个人页面"
        self.view.backgroundColor = .white
        view.backgroundColor = .white
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//        let backButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 15))
//        backButton.setImage(#imageLiteral(resourceName: "ic_arrow_left-1"), for: .normal)
//        backButton.addTarget(self, action: #selector(click), for: .touchUpInside)
//        backButton.width = 18
//        let backView = UIBarButtonItem(customView: backButton)
        
        // 重要方法，用来调整自定义返回view距离左边的距离
//        let spacer = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
//        spacer.width = -15
//        self.navigationItem.leftBarButtonItems = [backView, spacer]
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: <#T##UIBarButtonSystemItem#>, target: <#T##Any?#>, action: <#T##Selector?#>)
//        
//        var backImage = UIImage(named: "freccia")
//        backImage = backImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(image: backImage, style: .bordered, target: self, action: #selector(click))
        setTableView()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let vcs = navigationController?.viewControllers {
            if vcs.count >= 3 {
//                navigationController?.popToViewController(vcs[vcs.count - 2], animated: true)
//                UIView.setAnimationsEnabled(false)
//                UIView.animate(withDuration: 0.2) {
//                    self.navigationController?.popToViewController(vcs[vcs.count - 3], animated: true)
//                }
                navigationController?.popToViewController(vcs[vcs.count - 3], animated: true)
//                UIView.setAnimationsEnabled(true)
            } else {
                navigationController?.popToViewController(vcs[vcs.count - 1], animated: true)
            }
        }
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
    @objc func click(item: UIButton) {
//        navigationController?.pushViewController(AnswerViewController(), animated: true)
        
        if let vcs = navigationController?.viewControllers {
            if (vcs.count - 4) >= 0 {
                navigationController?.popToViewController(vcs[vcs.count - 4], animated: true)
            } else {
                navigationController?.popToViewController(vcs[vcs.count - 2], animated: true)
            }
        }
//        navigationController?.popToRootViewController(animated: true)
    }
    
    
}
extension AnswerMyInfoViewController: UITableViewDelegate, UITableViewDataSource {

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }

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

extension AnswerMyInfoViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let vcs = navigationController.viewControllers
        if (vcs.count - 4) >= 0 {
            navigationController.popToViewController(vcs[vcs.count - 4], animated: true)
        } else {
            navigationController.popToViewController(vcs[vcs.count - 2], animated: true)
        }
    }
}
