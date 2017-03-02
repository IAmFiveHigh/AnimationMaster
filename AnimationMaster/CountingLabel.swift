//
//  CountingLabel.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/1.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CountingLabel: UILabel {

    fileprivate var startValue: CGFloat!
    fileprivate var destinationValue: CGFloat!
    
    fileprivate var lastUpdate: TimeInterval = 0
    fileprivate var progress: TimeInterval = 0
    fileprivate var totalTime: TimeInterval = 0
    
    fileprivate var displayLink: CADisplayLink!
    
    func countFrom(startValue: CGFloat, to endValue:CGFloat, with duration: TimeInterval) {
        
        self.startValue = startValue
        self.destinationValue = endValue
        self.totalTime = duration
        
        //停止计时器
        if let displayLink = displayLink {
            
            displayLink.invalidate()
        }
        
        //判断持续时间是否为0
        if duration == 0{
            
            text = "\(endValue)"
            return
        }
        
        //获取当前时间
        lastUpdate = Date.timeIntervalSinceReferenceDate
        
        let timer = CADisplayLink(target: self, selector: #selector(updateText))
        timer.add(to: RunLoop.main, forMode: .defaultRunLoopMode)
        timer.add(to: RunLoop.main, forMode: .UITrackingRunLoopMode)
        displayLink = timer
    }

    
    @objc fileprivate func updateText() {
        
        let now = Date.timeIntervalSinceReferenceDate
        
        progress += now - lastUpdate
        lastUpdate = now
        
        if progress >= totalTime {
            
            displayLink.invalidate()
            progress = totalTime
        }
        
        text = currentValue()
    }
    
    fileprivate func currentValue() -> String {
        
        if progress >= totalTime {
            
            return NSString(format: "%.1f", destinationValue) as String
        }
        
        let percent = CGFloat(progress) / CGFloat(totalTime)
        let value = startValue + percent * (destinationValue - startValue)
        return NSString(format: "%.2f", value) as String
    }
}
