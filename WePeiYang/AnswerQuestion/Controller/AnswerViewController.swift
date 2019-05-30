//
//  AnswerViewController.swift
//  WePeiYang
//
//  Created by 王春杉 on 2019/5/19.
//  Copyright © 2019 twtstudio. All rights reserved.
//
// 理论答题主页
import UIKit
class AnswerViewController: UIViewController {
    var topNewsView: TopNewsScrollView?
    var mainScrollView: UIScrollView?
    var contentView: UIView?
    var pageController: WMPageController?
    
    // MARK: - 导航栏设置
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.white), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedStringKey.foregroundColor: UIColor.black]
        self.navigationController?.navigationBar.tintColor = UIColor.black
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "理论答题"
        self.view.backgroundColor = .white
        
        setMainScrollView()
        setTopNewsScrollView()
        setContentView()
        initNavButton()
    }
    // MARK: - 初始化主ScrollView
    func  setMainScrollView() {
        let navigationHeight = self.navigationController?.navigationBar.frame.size.height
        mainScrollView = UIScrollView(frame: CGRect(x: 0, y: 64, width: Device.width, height: Device.height))
        mainScrollView?.contentSize = CGSize(width: Device.width, height: Device.height*2)
        mainScrollView?.backgroundColor = .gray
        view.addSubview(mainScrollView!)
    }
    // MARK: - 初始化头部轮播图
    func setTopNewsScrollView() {
        topNewsView = TopNewsScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200))
        topNewsView?.addButtonBlock { (nums) in
            print("\(nums)")
        }
        self.mainScrollView?.addSubview(topNewsView!)
    }
    // MARK: - 初始化主内容(答题 通知)
    func setContentView() {
        contentView = UIView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: Device.height-64))
        contentView?.backgroundColor = .yellow
        
        pageController = WMPageController.init(viewControllerClasses: [ExamViewController.self, NoticeViewController.self], andTheirTitles: ["考试", "通知"])
        pageController!.menuViewStyle = .line
        pageController!.menuItemWidth = Device.width/4  // 每个 MenuItem 的宽度
        pageController!.menuHeight = 60            // 导航栏高度
        pageController!.menuHeight = 60            // 导航栏高度
//                pageController!.postNotification = true
//                pageController!.bounces = true
        pageController!.titleSizeSelected = 16    // 选中时的标题尺寸
        pageController!.titleSizeNormal = 15      // 非选中时的标题尺寸
        pageController!.titleColorSelected = UIColor.black    //标题选中时的颜色, 颜色是可动画的
        pageController!.titleColorNormal = UIColor.gray    //标题非选择时的颜色, 颜色是可动画的
        pageController!.menuBGColor = UIColor.white        //导航栏背景色
        pageController?.viewFrame = CGRect(x: 0, y: 0, width: Device.width, height: Device.height-64)
        self.mainScrollView?.addSubview(contentView!)
        contentView?.addSubview(self.pageController!.view)
    }
    // MARK: - 初始化导航栏右侧按钮
    func initNavButton() {
        //navitem search 搜索按钮
        let buttonSearch = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 15))
        buttonSearch.setImage(UIImage.init(named: "aq_sousuo"), for: UIControlState.normal)
        buttonSearch.addTarget(self, action: #selector(searchButton), for: UIControlEvents.touchUpInside)
        let barButtonSearch = UIBarButtonItem(customView: buttonSearch)
        
        //navitem 我的按钮
        let myInfoButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 15, height: 15))
        myInfoButton.setImage(UIImage.init(named: "aq_wode"), for: UIControlState.normal)
        myInfoButton.addTarget(self, action: #selector(myInfButton), for: UIControlEvents.touchUpInside)
        let barButtonService = UIBarButtonItem(customView: myInfoButton)
        
        //按钮间的空隙
        let gap = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        gap.width = 12;
        
        //用于消除右边边空隙，要不然按钮顶不到最边上
        let spacer = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        spacer.width = -5;
        
        //设置按钮（注意顺序）
        self.navigationItem.rightBarButtonItems = [spacer, barButtonService, gap, barButtonSearch]

    }
    @objc func searchButton(item: UIBarButtonItem) {
        let vc = AnswerSearchViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func myInfButton(item: UIBarButtonItem) {
        let vc = AnswerMyInfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
