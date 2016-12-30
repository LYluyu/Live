//
//  LYContentView.swift
//  Live
//
//  Created by luyu on 16/12/9.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

private let ContentCellID = "ContentCellID"

class LYPageContentView: UIView {
    fileprivate var childControllers: [UIViewController]
    fileprivate weak var presentVC: UIViewController?
    
    fileprivate lazy var collectionView: UICollectionView = { [weak self] in
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = (self?.bounds.size)!
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        
        collectionView.bounces = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.scrollsToTop = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: ContentCellID)
        return collectionView
    }()
    
    
    
    init(frame: CGRect, childControllers: [UIViewController], presentVC: UIViewController?) {
        self.childControllers = childControllers
        self.presentVC = presentVC
        
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


extension LYPageContentView {
    fileprivate func initUI() {
        for chidVC in childControllers {
            presentVC?.addChildViewController(chidVC)
        }
        
        addSubview(collectionView)
        collectionView.frame = bounds
        
    }
}

extension LYPageContentView: UICollectionViewDataSource {
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childControllers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCellID, for: indexPath)
        
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        
        let childVCView = childControllers[indexPath.item]
        childVCView.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVCView.view)
        
        return cell
    }
}

extension LYPageContentView: UICollectionViewDelegate {
    
}

