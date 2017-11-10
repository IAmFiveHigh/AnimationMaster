//
//  旋转loading图Controller.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/11/10.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class 旋转loading图Controller: BaseViewController {

    private let mainView = UIView()
    private var cycle1: CircleView!
    private var cycle2: CircleView!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.frame = CGRect(origin: view.center, size: CGSize(width: 200, height: 200))
        mainView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        view.addSubview(mainView)
        
        
        cycle1 = CircleView(frame: CGRect.zero, lineWidth: 2, lineColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), clockWise: true)
        cycle2 = CircleView(frame: CGRect.zero, lineWidth: 2, lineColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), clockWise: true)
        
        cycle1.set(starAngle: 0, endAngle: 180, animation: true)
        cycle2.set(starAngle: 180, endAngle: 360, animation: true)
        
        mainView.addSubview(cycle1)
        mainView.addSubview(cycle2)
        
        createTimer()
    }
    
    private func createTimer() {
        
        timer = Timer(timeInterval: 3.0, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func timeAction() {
        
//        let percent:CGFloat = CGFloat(arc4random_uniform(100) + 1) / 100
//        
//        let circle = view.viewWithTag(10) as! CircleView
        cycle1.strokeEnd(value: 1, duration: 3.0)
        cycle2.strokeEnd(value: 1, duration: 3.0)
    }

    
}
