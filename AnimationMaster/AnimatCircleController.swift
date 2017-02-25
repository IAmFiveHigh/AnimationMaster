//
//  AnimatCircleController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/24.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AnimatCircleController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
        
        createTimer()
    }

    
    fileprivate func createUI() {
    
        let circle = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        circle.center = view.center
        circle.set(starAngle: 0, endAngle: 360, animation: true)
        circle.tag = 10
        view.addSubview(circle)
        
    }
    
    fileprivate func createTimer() {
    
        let timer = Timer(timeInterval: 3.0, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func timeAction() {
        
        let percent:CGFloat = CGFloat(arc4random_uniform(100) + 1) / 100
        
        let circle = view.viewWithTag(10) as! CircleView
        circle.strokeEnd(value: percent, duration: 3.0)
    }
    
    
}
