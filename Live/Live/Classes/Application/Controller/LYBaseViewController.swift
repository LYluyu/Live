//
//  LYBaseViewController.swift
//  Live
//
//  Created by luyu on 16/12/10.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

class LYBaseViewController: UIViewController {

    var contentVeiw: UIView?
    
    fileprivate lazy var animatImageView: UIImageView = {
        let animatImageView = UIImageView(image: UIImage(named: "img_loading_1"))
        animatImageView.center = self.view.center
        print(animatImageView.center)
        animatImageView.animationImages = [UIImage(named: "img_loading_1")!, UIImage(named:"img_loading_2")!]
        animatImageView.animationDuration = 0.5
        animatImageView.animationRepeatCount = LONG_MAX
        animatImageView.autoresizingMask = [.flexibleTopMargin, .flexibleBottomMargin]
        return animatImageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initUI()
    }
    
}

extension LYBaseViewController {
    fileprivate func initUI() {
        // 隐藏内容view
        contentVeiw?.isHidden = true
        
        view.addSubview(animatImageView)
        animatImageView.startAnimating()
        
        view.backgroundColor = UIColor(r: 250.0, g: 250.0, b: 250.0)
        
    }
    
    func loadDataFinished() {
        animatImageView.stopAnimating()
        animatImageView.isHidden = true
        contentVeiw?.isHidden = false
    }
    
    
}
