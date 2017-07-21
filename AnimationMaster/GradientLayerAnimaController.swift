//
//  GradientLayerAnimaController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class GradientLayerAnimaController: BaseViewController {

    fileprivate var maskView: UIView!
    fileprivate var baseImageView: UIImageView!
    
    fileprivate var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        createImage()
        
        createMask()
        
        baseImageView.mask = maskView
        
    }

    
    fileprivate func createImage() {
        
        baseImageView = UIImageView(frame: UIScreen.main.bounds)
        baseImageView.image = UIImage(named: "2.jpg")
    
        view.addSubview(baseImageView)
    }
    
    fileprivate func  createMask() {

        
        maskView = UIView(frame: CGRect(x: 0, y: -200, width: 160, height: 160))
        maskView.layer.cornerRadius = 80
        maskView.layer.backgroundColor = UIColor.black.cgColor

    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        let pt = touch?.location(in: view)
        
        if let pt = pt {
            maskView.center = pt
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        
        let pt = touch?.location(in: view)
        
        if let pt = pt {
            maskView.center = pt
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        maskView.center = CGPoint(x: 0, y: -200)
    }
   
}
