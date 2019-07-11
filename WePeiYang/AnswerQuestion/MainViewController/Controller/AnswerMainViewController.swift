//
//  AnswerMainViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/18.
//  Copyright © 2019 twtstudio. All rights reserved.
//
// 理论答题PageView
import UIKit
import WMPageController

struct Device {
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
}
class AnswerMainViewController: WMPageController {
    
    // MARK: - 导航栏设置
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.white), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "理论答题"
        self.view.backgroundColor = .white
        
        setPageView()
        self.viewControllerClasses = [ExamViewController.self, NoticeViewController.self]
        self.titles = ["考试", "通知"]
    }
    // MARK: - 设置头部菜单
    func setPageView() {

        menuItemWidth = Device.width/4   // 每个 MenuItem 的宽度
        menuHeight = 60            // 导航栏高度
        postNotification = true
        bounces = true
        titleSizeSelected = 16    // 选中时的标题尺寸
        titleSizeNormal = 15      // 非选中时的标题尺寸
        menuViewStyle = .line    // Menu view 的样式，默认为无下划线
       // progressColor = .blue
        titleColorSelected = UIColor.black    //标题选中时的颜色, 颜色是可动画的.
        titleColorNormal = UIColor.gray    //标题非选择时的颜色, 颜色是可动画的
        menuBGColor = UIColor.white        //导航栏背景色
    }
    
}
