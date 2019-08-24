//
//  AnswerSearchViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/26.
//  Copyright © 2019 twtstudio. All rights reserved.
//

import UIKit
class AnswerSearchViewController: UIViewController {
    let searchBar = UISearchBar()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "搜索结果"
        self.view.backgroundColor = .white
        view.addSubview(searchBar)
        setUpSearchBar()
    }
    // - MARK: 设置搜索框
    func setUpSearchBar() {
        searchBar.snp.makeConstraints{ make in
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(30)
        }
        searchBar.placeholder = "请输入关键字"
        searchBar.delegate = self
    }
    
}
extension AnswerSearchViewController: UISearchBarDelegate {
    
}
