//
//  AnimatCircleController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/24.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AnimatCircleController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
        
    }

    
    fileprivate func createUI() {
    
        let circle = CircleView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        circle.center = view.center
        circle.set(starAngle: 90, endAngle: 180, animation: true)
        
        view.addSubview(circle)
        
    }
    
    
}
