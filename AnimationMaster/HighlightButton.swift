//
//  HighlightButton.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/7.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class HighlightButton: UIButton {

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                
//                let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
//                basicAnimation.toValue = CGSize(width: 0.8, height: 0.8)
//                basicAnimation.duration = 0.1
//                basicAnimation.isRemovedOnCompletion = false
//                basicAnimation.fillMode = kCAFillModeForwards
//                titleLabel?.layer.add(basicAnimation, forKey: nil)
                
                UIView.animate(withDuration: 0.2, animations: {[weak self] in
                    self?.titleLabel?.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                })
            }else {
                
//                let spring = CASpringAnimation(keyPath: "transform.scale")
//                spring.toValue = CGSize(width: 1, height: 1)
////                spring.duration = 0.1
//                spring.damping = 0
//                spring.mass = 1
//                spring.initialVelocity = 10
//                spring.isRemovedOnCompletion = false
//                spring.fillMode = kCAFillModeForwards
//                titleLabel?.layer.add(spring, forKey: nil)
                
                UIView.animate(withDuration: 0.2, animations: {[weak self] in
                    self?.titleLabel?.transform = CGAffineTransform(scaleX: 1, y: 1)
                })
            }
        }
    }


}
