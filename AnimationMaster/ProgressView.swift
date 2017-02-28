//
//  ProgressView.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/27.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    fileprivate let text: String
    fileprivate let timeInterval: TimeInterval
    fileprivate let backColor: UIColor
    
    var timer: Timer!
    fileprivate var upView: UIView!
    
    /// 创建方法
    ///
    /// - Parameters:
    ///   - frame: frame
    ///   - timeInterval: 变化时间间隔
    ///   - text: 内容
    ///   - backColor: 背景色和字体颜色
    init(frame: CGRect, timeInterval: TimeInterval, text: String, backColor: UIColor) {
        
        self.text = text
        self.timeInterval = timeInterval
        self.backColor = backColor
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        setupUI()
        
        setTimer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
    
        let downLabel = UILabel(frame: bounds)
        downLabel.text = text
        downLabel.textColor = backColor
        downLabel.textAlignment = .center
        downLabel.font = UIFont.systemFont(ofSize: height() / 2)
        self.addSubview(downLabel)
        
        upView = UIView(frame: bounds)
        upView.backgroundColor = backColor
        upView.layer.masksToBounds = true
        self.addSubview(upView)
        
        let upLabel = UILabel(frame: bounds)
        upLabel.text = text
        upLabel.textColor = UIColor.white
        upLabel.textAlignment = .center
        upLabel.font = UIFont.systemFont(ofSize: height() / 2)
        upView.addSubview(upLabel)
    }
    
    fileprivate func setTimer() {
        
        timer = Timer(timeInterval: timeInterval, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
        
    }
    
    @objc fileprivate func timeAction() {
        
        let percent = CGFloat(arc4random() % 100) / 100
        UIView.animate(withDuration: timeInterval, animations: {
            
            self.upView.setWidth(self.width() * percent)
        })
    }

    
    /// 停止动画
    func timerStop() {
        
        timer.fireDate = Date.distantFuture
    }
    
    /// 继续动画
    func timerContinue() {
        
        timer.fireDate = Date.distantPast
    }
    
    /// 移除timer
    func timerDealloc() {
        
        timer.invalidate()
    }
}
