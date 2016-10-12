//
//  LYTabBarController.swift
//  Live
//
//  Created by luyu on 16/9/23.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

class LYTabBarController: UITabBarController {
    
}

// MARK:- 系统回调
extension LYTabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.添加子控制器
        
        addOneChildViewController(LYHomeViewController(), norImage: UIImage(named: "tabHome"), selImage: UIImage(named: "tabHomeHL"), title: "首页")
        addOneChildViewController(LYHomeViewController(), norImage: UIImage(named: "tabLiving"), selImage: UIImage(named: "tabLivingHL"), title: "直播")
        addOneChildViewController(LYHomeViewController(), norImage: UIImage(named: "tabFocus"), selImage: UIImage(named: "tabFocusHL"), title: "关注")
        addOneChildViewController(LYHomeViewController(), norImage: UIImage(named: "tabMine"), selImage: UIImage(named: "tabMineHL"), title: "我的")
    }
    
}

// MARK:- 控制器的初始化操作
extension LYTabBarController {
    private func addOneChildViewController(vc: UIViewController, norImage: UIImage?, selImage: UIImage?, title: String) {
        let nav = LYNavigationController(rootViewController: vc)
        vc.tabBarItem.image = norImage
        vc.tabBarItem.selectedImage = selImage
        vc.title = title
        addChildViewController(nav)
    }
}
