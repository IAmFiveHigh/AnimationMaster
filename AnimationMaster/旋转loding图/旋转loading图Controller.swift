//
//  旋转loading图Controller.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/11/10.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class 旋转loading图Controller: BaseViewController {

    enum RotationType {
        case 张开
        case 收缩
    }
    private var type: RotationType = .张开
    
    private let mainView = UIView()
    private var cycle1: CircleView!
    private var cycle2: CircleView!
    
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.frame = CGRect(origin: view.center, size: CGSize(width: 200, height: 200))
        mainView.center = view.center
        mainView.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        view.addSubview(mainView)
        
        
        cycle1 = CircleView(frame: CGRect.zero, lineWidth: 2, lineColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), clockWise: true)
        cycle2 = CircleView(frame: CGRect.zero, lineWidth: 2, lineColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), clockWise: true)
        
        cycle1.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        cycle2.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        
        cycle1.set(starAngle: 0, endAngle: 180, animation: true)
        cycle2.set(starAngle: 180, endAngle: 360, animation: true)
        
        mainView.addSubview(cycle1)
        mainView.addSubview(cycle2)
        
        addRotateAnima()
        createTimer()
        
    }
    
    private func createTimer() {
        
        timer = Timer(timeInterval: 3.0, target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func timeAction() {
        var largeD: CGFloat = 0
        var smallD: CGFloat = 0
        if type == .张开 {
            largeD = 1
            smallD = 0
            type = .收缩
        }else {
            largeD = 0.5
            smallD = 0.5
            type = .张开
        }
        
        cycle1.strokeEnd(value: largeD, duration: 3.0)
        cycle2.strokeEnd(value: largeD, duration: 3.0)
        
        cycle1.strokeStart(value: smallD, duration: 3.0)
        cycle2.strokeStart(value: smallD, duration: 3.0)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.fireDate = Date.distantFuture
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        timer?.fireDate = Date.distantPast
    }
    
    private func addRotateAnima() {
    
        let anima = CABasicAnimation(keyPath: "transform.rotation")
        anima.fromValue = 0
        anima.toValue = CGFloat.pi * 2
        anima.duration = 3
        anima.repeatCount = HUGE
        cycle2.layer.add(anima, forKey: "rotation")
        cycle1.layer.add(anima, forKey: "rotation")
    }
    
}
