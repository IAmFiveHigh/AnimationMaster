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
    
    fileprivate var centerV: Vector2!
    
    fileprivate var littleWaterDropArrays = [WaterDrop]()
    
    fileprivate lazy var bigWaterDrop: WaterDrop = {
       
        let wd = WaterDrop(radius: 0, center: CGPoint(x: screenWidth / 2, y: screenHeight / 2))
        return wd
    }()
    
    fileprivate var timer: Timer!
    
    fileprivate var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        centerV = Vector2(x: Double(view.center.x), y: Double(view.center.y))
        
        view.addSubview(bigWaterDrop)
        
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
        let p = v + centerV
        
        let littleWaterDrop = WaterDrop(radius: 10, center: CGPoint(x: p.x, y: p.y))
        view.addSubview(littleWaterDrop)
        
        let layer = createPathByPoint(CGPoint(x: p.x, y: p.y), v: v)
        
        let animation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1
        animation.path = layer.path
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        animation.delegate = self
        littleWaterDrop.layer.add(animation, forKey: "littleWaterMove\(index)")
        
        littleWaterDropArrays.append(littleWaterDrop)
        
        //index 自加一
        index += 1
    }
    
    fileprivate func createPathByPoint(_ point: CGPoint, v: Vector2) -> CAShapeLayer {
        
        let bezierPath = UIBezierPath()
        
        bezierPath.move(to: point)
        
        //随机获得方向
        let arc90Angle: RotationDirection = arc4random() % 2 == 0 ? .顺时针 : .逆时针
        
        //获取中间点向量
        let newMidV = Vector2(x: v.x / 2, y: v.y / 2)
        
        //根据方向偏转向量
        let newV = newMidV.transfrom90Angle(rotationDirect: arc90Angle)
        
        //控制点向量
        let controV = newMidV + newV + centerV
        
        bezierPath.addQuadCurve(to: view.center, controlPoint: CGPoint(x: controV.x, y: controV.y))
        
        let shapelayer = CAShapeLayer()
        shapelayer.path = bezierPath.cgPath
        
        return shapelayer
    }
    
    fileprivate func centerWaterDropAction() {
        
        if bigWaterDrop.radius == 0 {
            
            bigWaterDrop.radius += 10
        }else {
            
            bigWaterDrop.radius += 3
        }
        
        
    }
    
    fileprivate func createTimer() {
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(action), userInfo: nil, repeats: true)
        timer.fireDate = Date.distantPast
        RunLoop.main.add(timer, forMode: .defaultRunLoopMode)
    }
    
    @objc fileprivate func action() {
        
        createArcWaterDrop()
    }
}

extension WaterDropGatherAnimController: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        //
        littleWaterDropArrays.removeFirst().removeFromSuperview()
        centerWaterDropAction()
    }
}

class WaterDrop: UIView {
    
    var radius: CGFloat {
        didSet {
            let tmp = center
            UIView.animate(withDuration: 0.15) {
                self.setWidth(self.radius * 2)
                self.setHeight(self.radius * 2)
                self.center = tmp
                self.layer.cornerRadius = self.radius
            }
            
        }
    }
    
    convenience init(radius: CGFloat, center: CGPoint) {
        
        self.init(frame: CGRect(x: center.x, y: center.y, width: radius * 2, height: radius * 2))
    }
    
    override init(frame: CGRect) {
        
        self.radius = frame.width / 2
        
        super.init(frame: frame)
        
        backgroundColor = UIColor(hexColor: "32B4FF")
        
        layer.cornerRadius = self.radius
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
