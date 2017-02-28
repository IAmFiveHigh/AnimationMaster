//
//  AnimatCircleController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/24.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AnimatCircleController: BaseViewController {
    
    var timer: Timer!
    
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
    
        timer = Timer(timeInterval: 3.0, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func timeAction() {
        
        let percent:CGFloat = CGFloat(arc4random_uniform(100) + 1) / 100
        
        let circle = view.viewWithTag(10) as! CircleView
        circle.strokeEnd(value: percent, duration: 3.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.fireDate = Date.distantFuture
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer.fireDate = Date.distantPast
    }
    
}
