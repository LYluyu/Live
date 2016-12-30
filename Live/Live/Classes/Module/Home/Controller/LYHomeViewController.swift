//
//  LYHomeViewController.swift
//  Live
//
//  Created by luyu on 16/12/6.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit
let kTitleH: CGFloat = 40
class LYHomeViewController: UIViewController {

    fileprivate lazy var pageTitleView: LYPageTitleView = { [weak self] in
        let frame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleH)
        let titles: [String] = ["推荐", "手游", "娱乐", "游戏", "趣玩"]
        let pageTitleView = LYPageTitleView(frame: frame, titles: titles)
        return pageTitleView
    }()
    
    fileprivate lazy var pageContentView: LYPageContentView = {
        let y = kStatusBarH + kNavigationBarH + kTitleH
        let frame = CGRect(x: 0, y: y, width: kScreenW, height: kScreenH - y - kTabBarH)
        var childControllers = [UIViewController]()
        childControllers.append(LYRecommendController())
        childControllers.append(LYPhoneGameController())
        childControllers.append(LYAmuseController())
        childControllers.append(LYGameViewController())
        childControllers.append(LYFunnyViewController())
        let pageContentView = LYPageContentView(frame: frame, childControllers: childControllers, presentVC: self)
        
        return pageContentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 配置基本信息
        configBase()
        
        // 设置导航栏
        setupNavigation()
        
        // 添加控件
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension LYHomeViewController {
    
    fileprivate func configBase() {
        view.backgroundColor = UIColor.white
        
        automaticallyAdjustsScrollViewInsets = false
    }
    
    fileprivate func setupNavigation() {
        
        // 左边导航栏
        navigationItem.leftBarButtonItem = UIBarButtonItem(normalImage: "homeLogoIcon")
        
        // 右边导航栏
        let size = CGSize(width: 40, height: 40)
        let searchItem = UIBarButtonItem(normalImage: "searchBtnIcon", hightlightImage: "searchBtnIconHL", size: size)
        let scanItem = UIBarButtonItem(normalImage: "scanIcon", hightlightImage: "scanIconHL", size: size)
        let historyItem = UIBarButtonItem(normalImage: "viewHistoryIcon", hightlightImage: "viewHistoryIconHL", size: size)
        let messageItem = UIBarButtonItem(normalImage: "siteMessageHome", hightlightImage: "siteMessageHomeHL", size: size)
        
        navigationItem.rightBarButtonItems = [searchItem, scanItem, historyItem, messageItem]
        
    }
    
    fileprivate func initUI() {
        view.addSubview(pageTitleView)
        
        view.addSubview(pageContentView)
    }
    
}
