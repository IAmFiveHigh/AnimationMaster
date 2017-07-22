//
//  WaterDropGatherAnimController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class WaterDropGatherAnimController: BaseViewController {

    fileprivate var littleWaterDropArrays = [WaterDrop]()
    
    fileprivate var bigWaterDrop: WaterDrop!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createBG()
        
        
    }

    fileprivate func createBG() {
        
        let path = UIBezierPath(arcCenter: view.center, radius: 80, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
        let shaperLayer = CAShapeLayer()
        shaperLayer.path = path.cgPath
        shaperLayer.strokeColor = UIColor(hexColor: "32B4FF").cgColor
        shaperLayer.fillColor = UIColor.clear.cgColor
        shaperLayer.lineWidth = 5
        view.layer.addSublayer(shaperLayer)
    }

}

class WaterDrop: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(hexColor: "32B4FF")
        
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
