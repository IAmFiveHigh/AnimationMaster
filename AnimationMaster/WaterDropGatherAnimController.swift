//
//  WaterDropGatherAnimController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class WaterDropGatherAnimController: BaseViewController {

    // 生成水滴的半径圆弧
    fileprivate let startRadius: Double = 160
    
    // 背景圆弧的半径
    fileprivate let arcRadius: CGFloat = 80
    
    
    
    fileprivate var littleWaterDropArrays = [WaterDrop]()
    
    fileprivate var bigWaterDrop: WaterDrop!
    
    fileprivate var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createBG()
        
        createTimer()
    }

    fileprivate func createBG() {
        
        let path = UIBezierPath(arcCenter: view.center, radius: arcRadius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        let shaperLayer = CAShapeLayer()
        shaperLayer.path = path.cgPath
        shaperLayer.strokeColor = UIColor(hexColor: "32B4FF").cgColor
        shaperLayer.fillColor = UIColor.clear.cgColor
        shaperLayer.lineWidth = 5
        view.layer.addSublayer(shaperLayer)
    }
    
    fileprivate func createArcWaterDrop() {
        
        let tmpAngle = arc4random_uniform(360)
//        let a = CGFloat(tmpAngle) / 180.0
        let v = Vector2(x: startRadius * cos(Double(tmpAngle)), y: startRadius * sin(Double(tmpAngle)))
        let p = v + Vector2(x: Double(view.centerX()), y: Double(view.centerY()))
        
        let littleWaterDrop = WaterDrop(radius: 20, center: CGPoint(x: p.x, y: p.y))
        view.addSubview(littleWaterDrop)
        
        let layer = createPathByPoint(CGPoint(x: p.x, y: p.y), v: v)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1
        animation.path = layer.path
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        littleWaterDrop.layer.add(animation, forKey: "littleWaterMove")
    }
    
    fileprivate func createPathByPoint(_ point: CGPoint, v: Vector2) -> CAShapeLayer {
        
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: point)
        bezierPath.addLine(to: view.center)
        
        let shapelayer = CAShapeLayer()
        shapelayer.path = bezierPath.cgPath
        
        return shapelayer
    }
    
    fileprivate func createTimer() {
        
        timer = Timer(timeInterval: 0.8, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        timer.fireDate = Date.distantPast
        RunLoop.main.add(timer, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func action() {
        
        createArcWaterDrop()
    }
}

class WaterDrop: UIView {
    
    convenience init(radius: CGFloat, center: CGPoint) {
        
        self.init(frame: CGRect(x: center.x, y: center.y, width: radius, height: radius))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hexColor: "32B4FF")
        
        layer.cornerRadius = frame.width / 2
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
