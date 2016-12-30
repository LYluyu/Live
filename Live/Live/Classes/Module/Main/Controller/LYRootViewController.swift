//
//  LYRootViewController.swift
//  Live
//
//  Created by luyu on 16/12/6.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

class LYRootViewController: UITabBarController {

    let titles: [String] = ["首页", "直播", "视频", "关注", "我的"]
    let normalImageNames: [String] = ["tabHome", "tabLiving", "tabVideo", "tabFocus", "tabMine"]
    let selImageNames: [String] = ["tabHomeHL", "tabLivingHL", "tabVideoHL", "tabFocusHL", "tabMineHL"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加所有控制器
        setupAllController()
        // 设置item的标题和图片
        setupTitleAndItemImage()
    }
    
}

extension LYRootViewController {
    fileprivate func setupAllController() {
        // 首页
        let homeVC = packWithNavigationController(vc: LYHomeViewController())
        // 直播
        let liveVC = packWithNavigationController(vc: LYHomeViewController())
        // 视频
        let videoVC = packWithNavigationController(vc: LYHomeViewController())
        // 关注
        let followVC = packWithNavigationController(vc: LYHomeViewController())
        // 我的
        let profileVC = packWithNavigationController(vc: LYHomeViewController())
        
        self.viewControllers = [homeVC, liveVC, videoVC, followVC, profileVC]
    }
    
    fileprivate func packWithNavigationController(vc: UIViewController) -> UIViewController {
        let nav = LYNavigationController(rootViewController: vc)
        return nav
    }
    
    fileprivate func setupTitleAndItemImage() {
        
        for i in 0..<titles.count {
            
            let title = titles[i]
            let item = tabBar.items?[i]
            item?.title = title
            item?.image = UIImage.init(named: normalImageNames[i])?.withRenderingMode(.alwaysOriginal)
            item?.selectedImage = UIImage.init(named: selImageNames[i])?.withRenderingMode(.alwaysOriginal)
        }
        
    }
}
