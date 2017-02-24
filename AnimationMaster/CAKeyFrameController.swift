//
//  CAKeyFrameController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/23.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CAKeyFrameController: BaseViewController {

    let tmpView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createUI()
    }
    
    fileprivate func createUI() {
        
        let titleArray = [KeyFrameType.positionPath.rawValue, KeyFrameType.positionValue.rawValue]
        
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
            case KeyFrameType.positionPath.rawValue:
                
                let animation = CAKeyframeAnimation(keyPath: "position")
                let bezierPath = UIBezierPath(arcCenter: tmpView.center, radius: 50, startAngle: .pi, endAngle: -.pi, clockwise: false)
                animation.path = bezierPath.cgPath
                animation.duration = 2.0
                animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
                tmpView.layer.add(animation, forKey: "positionPath")
            case KeyFrameType.positionValue.rawValue:
                
                let point = CGPoint(x: 100, y: 200)
                let point1 = CGPoint(x: point.x + 50, y: point.y)
                let point2 = CGPoint(x: point1.x, y: point1.y + 100)
                let point3 = CGPoint(x: point2.x - 100, y: point2.y - 50)
                
                let animation = CAKeyframeAnimation(keyPath: "position")
                let value1 = NSValue(cgPoint: point1)
                let value2 = NSValue(cgPoint: point2)
                let value3 = NSValue(cgPoint: point3)
                animation.keyTimes = [5,2,10]
                animation.values = [value1,value2,value3]
                animation.duration = 19
                tmpView.layer.add(animation, forKey: "positionValue")
            default:
                print("default")
            }
        }
    }

}

enum KeyFrameType: String {
    case positionPath
    case positionValue
}
