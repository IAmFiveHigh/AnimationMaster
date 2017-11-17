//
//  旋转loading图Controller.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/11/10.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class 旋转loading图Controller: BaseViewController {

    var sharp: CAShapeLayer!
    var sharp2: CAShapeLayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mainView.backgroundColor = UIColor.black
        mainView.center = view.center
        view.addSubview(mainView)

        addRotationAnima(view: mainView, duration: 2)
        
        sharp = createLoadingLayer(center: CGPoint(x: 50, y: 50), radius: 50, clockwise: true, width: 15)
        sharp2 = createLoadingLayer(center: CGPoint(x: 50, y: 50), radius: 50, clockwise: false, width: 15)
        
        mainView.layer.addSublayer(sharp)
        mainView.layer.addSublayer(sharp2)
        
        view.backgroundColor = UIColor.black
    }
    
    private func createLoadingLayer(center: CGPoint, radius: CGFloat, clockwise: Bool, width: CGFloat = 3, color: UIColor = UIColor.white) -> CAShapeLayer {
        
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: -0.5 * CGFloat.pi, endAngle: 0.5 * CGFloat.pi, clockwise: clockwise)
        
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineCap = kCALineCapRound
        layer.lineWidth = width
        layer.fillColor = nil
        layer.strokeColor = color.cgColor
        
        let anima1 = CABasicAnimation(keyPath: "strokeStart")
        anima1.fromValue = 0.5
        anima1.toValue = 0.1
        anima1.duration = 2
        anima1.repeatCount = HUGE
        anima1.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        anima1.autoreverses = true
        
        let anima2 = CABasicAnimation(keyPath: "strokeEnd")
        anima2.fromValue = 0.5
        anima2.toValue = 0.9
        anima2.duration = 2
        anima2.repeatCount = HUGE
        anima2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        anima2.autoreverses = true
        
        layer.add(anima1, forKey: "")
        layer.add(anima2, forKey: "")
        return layer
    }
    
    private func addRotationAnima(view: UIView, duration: TimeInterval) {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = 2 * CGFloat.pi
        rotation.duration = duration
        
        rotation.repeatCount = HUGE
        view.layer.add(rotation, forKey: "")
    }
}
