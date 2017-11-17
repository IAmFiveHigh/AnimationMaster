//
//  咻一咻ViewController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/11/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class 咻一咻ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let origin = CGPoint(x: view.center.x - 50, y: view.center.y - 50)
        let size = CGSize(width: 100, height: 100)
        
        let testView = UIView(frame: CGRect(origin: origin, size: size))
        
        let layer = create咻一咻view(size: size, color: UIColor.red)
        testView.layer.addSublayer(layer)
        
        view.addSubview(testView)
    }
    
    private func create咻一咻view(size: CGSize, color: UIColor, count: Int = 4, duration: TimeInterval = 4) -> CAReplicatorLayer {
        
        let pulseLayer = CAShapeLayer()
        pulseLayer.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: size)

        pulseLayer.path = UIBezierPath(ovalIn: pulseLayer.bounds).cgPath
        pulseLayer.fillColor = color.cgColor
        pulseLayer.opacity = 0.0
        
        let replicatorLayer = CAReplicatorLayer()
        replicatorLayer.frame = pulseLayer.bounds
        replicatorLayer.instanceCount = count
        replicatorLayer.instanceDelay = 1
        replicatorLayer.addSublayer(pulseLayer)
        
        let opacityAnima = CABasicAnimation(keyPath: "opacity")
        opacityAnima.fromValue = 0.3
        opacityAnima.toValue = 0
        
        let scaleAnima = CABasicAnimation(keyPath: "transform")
        scaleAnima.fromValue = NSValue.init(caTransform3D: CATransform3DMakeScale(0, 0, 0))
        scaleAnima.toValue = NSValue.init(caTransform3D: CATransform3DMakeScale(1, 1, 1))
        
        let groupAnima = CAAnimationGroup()
        groupAnima.animations = [opacityAnima, scaleAnima]
        groupAnima.duration = duration
        groupAnima.autoreverses = false
        groupAnima.repeatCount = HUGE
        pulseLayer.add(groupAnima, forKey: "groupAnimaion")
        
        return replicatorLayer
    }

    

}
