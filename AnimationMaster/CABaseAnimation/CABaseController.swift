//
//  CABaseController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/23.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit


class CABaseController: UIViewController {

    let tmpView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        createUI()
    }
    
    fileprivate func createUI() {
        
        let titleArray = [BaseAnimationType.opacity.rawValue, BaseAnimationType.cornerRadius.rawValue, BaseAnimationType.transformX.rawValue, BaseAnimationType.positionY.rawValue]
        
        let buttonMargin: CGFloat = 10
        let buttonWidth: CGFloat = (screenWidth - buttonMargin * 5) / CGFloat(titleArray.count)
        
        for (index,title) in titleArray.enumerated() {
            
            let button = UIButton(type: .custom)
            button.frame = CGRect(x: buttonMargin + CGFloat(index) * (buttonMargin + buttonWidth), y: 60, width: buttonWidth, height: 60)
            button.setTitle(title, for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
        
        
        let tmpViewWidth: CGFloat = 100
        tmpView.frame = CGRect(x: (screenWidth - tmpViewWidth) / 2, y: 200, width: tmpViewWidth, height: tmpViewWidth)
        tmpView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        view.addSubview(tmpView)
    }

    
    @objc fileprivate func buttonClick(sender: UIButton) {
        
        if let title = sender.titleLabel?.text {
            switch title {
                
            case BaseAnimationType.opacity.rawValue:
                
                let opacityAnima = CABasicAnimation(keyPath: title)
                opacityAnima.toValue = 0.5
                opacityAnima.duration = 1.0
                tmpView.layer.add(opacityAnima, forKey: title)
            case BaseAnimationType.cornerRadius.rawValue:
                
                let cornerAnima = CABasicAnimation(keyPath: title)
                cornerAnima.toValue = 20
                cornerAnima.duration = 1.0
                tmpView.layer.add(cornerAnima, forKey: title)
            case BaseAnimationType.transformX.rawValue:
                
                let transformX = CABasicAnimation(keyPath: "transform.scale.x")
                transformX.toValue = 0.5
                transformX.duration = 1.0
                tmpView.layer.add(transformX, forKey: "transform.scale.x")
            case BaseAnimationType.positionY.rawValue:
                
                let positionY = CABasicAnimation(keyPath: "position.y")
                positionY.toValue = 400
                positionY.duration = 1.0
                tmpView.layer.add(positionY, forKey: "position.y")
            default:
                print("default")
            }
        }
        
    }
}

enum BaseAnimationType: String {
    case opacity
    case cornerRadius
    case transformX
    case positionY
}
