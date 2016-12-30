//
//  UIBarButtonItem-Extension.swift
//  Live
//
//  Created by luyu on 16/12/6.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(normalImage: String, hightlightImage: String = "", size: CGSize = CGSize.zero, title: String = "") {
        let button = UIButton(type: .custom)
        button.setImage(UIImage.init(named: normalImage)?.withRenderingMode(.alwaysOriginal), for: .normal)
        if hightlightImage.isEmpty == false {
            button.setImage(UIImage.init(named: hightlightImage)?.withRenderingMode(.alwaysOriginal), for: .highlighted)
        }
        
        if size != CGSize.zero {
            button.frame = CGRect(origin: CGPoint.zero, size: size)
        } else {
            button.sizeToFit()
        }
        
        if title.isEmpty == false {
            button.setTitle(title, for: .normal)
        }
        
        self.init(customView: button)
    }
    
}
