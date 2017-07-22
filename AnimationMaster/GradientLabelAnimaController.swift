//
//  GradientLabelAnimaController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class GradientLabelAnimaController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black
        
        let label = UILabel(frame: CGRect(x: 50, y: 300, width: screenWidth - 100, height: 50))
        label.text = "向右滑动解不了锁"
        label.font = UIFont.systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = UIColor.white
        view.addSubview(label)
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = label.bounds
        gradientLayer.colors = [UIColor.green.withAlphaComponent(0.3).cgColor, UIColor.black.cgColor, UIColor.green.withAlphaComponent(0.3).cgColor]
        gradientLayer.locations = [0, 0, 0.1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 25)
        gradientLayer.endPoint = CGPoint(x: 1, y: 25)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.toValue = [0.9, 1.0, 0.9]
        animation.repeatCount = .infinity
        animation.duration = 2.0
//        animation.fillMode = kCAFillModeForwards
//        animation.isRemovedOnCompletion = false
        
        gradientLayer.add(animation, forKey: "location")
        label.layer.mask = gradientLayer
    }


}
