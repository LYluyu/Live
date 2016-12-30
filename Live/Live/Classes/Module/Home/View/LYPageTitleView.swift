//
//  LYPageTitleView.swift
//  Live
//
//  Created by luyu on 16/12/6.
//  Copyright © 2016年 luyu. All rights reserved.
//

import UIKit

protocol LYPageTitleViewDelegate {
    func pageTitleView(pageTitleView: LYPageTitleView, currentIndex: Int)
}

let normalColor: (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
let selectedColor: (CGFloat, CGFloat, CGFloat) = (255, 128, 0)
let scrollHeight: CGFloat = 2
class LYPageTitleView: UIView {

    fileprivate var titles : [String]
    fileprivate var titleLabels: [UILabel] = [UILabel]()
    init(frame: CGRect, titles: [String]) {
        self.titles = titles
        super.init(frame: frame)
        initUI()
    }
    
    fileprivate var currentIndex: Int = 0
    
    fileprivate lazy var scrollLine: UIView = { [weak self] in
        let scrollLine = UIView()
        scrollLine.backgroundColor = UIColor.orange
        return scrollLine
    }()
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.scrollsToTop = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        
        return scrollView
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension LYPageTitleView {
    fileprivate func initUI() {
        addSubview(scrollView)
        
        scrollView.frame = bounds
        
        initTitleLabels()
        
        initBottomLineAndScrollLine()
    }
    
    fileprivate func initTitleLabels() {
        print(scrollView.frame)
        let labelY: CGFloat = 0
        var labelX: CGFloat = 0
        let labelW: CGFloat = kScreenW / CGFloat(titles.count)
        let labelH: CGFloat = frame.size.height - scrollHeight
        for (index, title) in titles.enumerated() {
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 14)
            label.tag = index
            label.textColor = UIColor(r: normalColor.0, g: normalColor.1, b: normalColor.2)
            label.textAlignment = .center
            labelX = labelW * CGFloat(index)
            label.frame = CGRect(x: labelX, y: labelY, width: labelW, height: labelH)
            scrollView.addSubview(label)
            titleLabels.append(label)
            // 添加手势
            label.isUserInteractionEnabled = true
            let tapGes = UITapGestureRecognizer(target: self, action: #selector(LYPageTitleView.titleLabelDidClicked(_:)))
            label.addGestureRecognizer(tapGes)
            print(label.frame)
            
        }
    }
    
    fileprivate func initBottomLineAndScrollLine() {
        let bottomLine = UIView()
        let bottomLineH: CGFloat = 0.5
        bottomLine.frame = CGRect(x: 0, y: frame.height - bottomLineH, width: frame.width, height: bottomLineH)
        scrollView.addSubview(bottomLine)
        
        scrollView.addSubview(scrollLine)
        guard let firstLabel = titleLabels.first else {
            return
        }
        scrollLine.frame = CGRect(x: firstLabel.frame.origin.x, y: scrollView.frame.height - scrollHeight, width: firstLabel.frame.width, height: scrollHeight)
    }
    
    @objc fileprivate func titleLabelDidClicked(_ tapGes: UITapGestureRecognizer) {
        // 获取当前选中的label 
        guard let label = tapGes.view as? UILabel else {
            return
        }
        
        if label.tag == currentIndex {
            return
        }
        
        let oldLabel = titleLabels[currentIndex]
        oldLabel.textColor = UIColor(r: normalColor.0, g: normalColor.1, b: normalColor.2)
        label.textColor = UIColor(r: selectedColor.0, g: selectedColor.1, b: selectedColor.2)
        currentIndex = label.tag
        let scrollX = label.frame.origin.x
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            self?.scrollLine.frame.origin.x = scrollX
        })
    }
    
    fileprivate func setProgress(progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        
    }
    
    
    
    
}
