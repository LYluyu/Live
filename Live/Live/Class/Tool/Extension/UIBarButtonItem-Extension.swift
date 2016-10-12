//
//  UIBarButtonItem-Extension.swift
//  Live
//
//  Created by luyu on 16/9/27.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    // 便利构造函数
    convenience init(normalImageName: String, hightLightImageName: String = "", size: CGSize = CGSizeZero) {
        let button = UIButton()
        button.setImage(UIImage(named: normalImageName), forState: .Normal)
        if hightLightImageName != "" {
            button.setImage(UIImage(named: hightLightImageName), forState: .Highlighted)
        }
        
        if size != CGSizeZero {
            button.frame = CGRect(origin: CGPointZero, size: size)
        } else {
            button.sizeToFit()
        }
        
        self.init(customView: button)
    }
}