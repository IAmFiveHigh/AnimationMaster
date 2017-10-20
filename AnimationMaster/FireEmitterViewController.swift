//
//  FireEmitterViewController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/10/20.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class FireEmitterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        add烟花()
    }

    private func add烟花() {
        
        let fireEmitter = CAEmitterLayer()
        fireEmitter.emitterPosition = CGPoint(x: screenWidth / 2, y: screenHeight - 100)
        fireEmitter.emitterSize = CGSize(width: screenWidth / 2, height: 0)
        fireEmitter.emitterMode = kCAEmitterLayerOutline
        fireEmitter.emitterShape = kCAEmitterLayerLine
        fireEmitter.renderMode = kCAEmitterLayerAdditive
        fireEmitter.seed = (arc4random() % 100) + 1
        
        let rocket = CAEmitterCell()
        rocket.birthRate = 1.0
        rocket.emissionRange = 0.25 * CGFloat.pi
        rocket.velocity = 380
        rocket.velocityRange = 100
        rocket.yAcceleration = 75
        rocket.lifetime = 1.02
        
        rocket.contents = UIImage(named: "DazRing")?.cgImage
        rocket.scale = 0.2
        rocket.color = UIColor.red.cgColor
        rocket.greenRange = 1
        rocket.redRange = 1
        rocket.blueRange = 1
        rocket.spinRange = CGFloat.pi
        
        
        let burst = CAEmitterCell()
        burst.birthRate = 1
        burst.velocity = 0
        burst.scale = 2.5
        burst.redSpeed = -1.5
        burst.blueSpeed = 1.5
        burst.greenSpeed = 1.0
        burst.lifetime = 0.35
        
        let spark = CAEmitterCell()
        spark.birthRate = 400
        spark.velocity = 125
        spark.emissionRange = 2 * CGFloat.pi
        spark.yAcceleration = 75
        spark.lifetime = 3
        
        spark.contents = UIImage(named: "DazStarOutline")?.cgImage
        spark.scaleSpeed = -0.2
        spark.greenSpeed = -0.1
        spark.redSpeed = 0
        spark.blueSpeed = -0.2
        spark.alphaSpeed = -0.25
        spark.spin = 2 * CGFloat.pi
        spark.spinRange = 2 * CGFloat.pi
        
        // 3种粒子组合，可以根据顺序，依次烟花弹－烟花弹粒子爆炸－爆炸散开粒子
        
        fireEmitter.emitterCells = [rocket]
        rocket.emitterCells = [burst]
        burst.emitterCells = [spark]
        view.layer.addSublayer(fireEmitter)
        
    }

}
