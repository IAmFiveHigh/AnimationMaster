//
//  BounceJellyAnimation.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/13.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class BounceJellyAnimation: BaseViewController {

    
    var shapeLayer: CAShapeLayer!
    var isAnimate: Bool = false
    lazy var arcView:UIView = {
        let v = UIView(frame: CGRect(x: screenWidth / 2 - 1, y: 100 - 2, width: 2, height: 2))
        v.backgroundColor = UIColor(hexColor: "32B4FF")
        v.alpha = 0
        return v
    }()
    
    var isTouch: Bool = false
    
    var display: CADisplayLink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jellyAnimation()

    }
    
    //MARK: - 果冻动画
    func jellyAnimation() {
        view.addSubview(arcView)
        
        shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor(hexColor: "32B4ff").cgColor
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: screenWidth, height: 100))
        shapeLayer.path = path.cgPath
        view.layer.addSublayer(shapeLayer)
        
        display = CADisplayLink(target: self, selector: #selector(displayRun))
        display.add(to: RunLoop.current, forMode: .defaultRunLoopMode)
        display.isPaused = true
        
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panGusture(pan:)))
        view.addGestureRecognizer(pan)
    }
    
    func panGusture(pan: UIPanGestureRecognizer) {
        
        if pan.state == .began {
            let pt = pan.location(in: self.view)
            if pt.y <= 100 {
                isTouch = true
            }else {
                isTouch = false
            }
        }else if pan.state == .changed {
            
            if isTouch {
                
                let pt = pan.location(in: self.view)
                updateLayerAndViewWith(pt)
            }
        }else {
            
            isAnimate = true
            display.isPaused = false
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 20, options: .curveEaseInOut, animations: {
                self.arcView.center = CGPoint(x: screenWidth / 2, y: 100 - 2)
            }, completion: { (finish) in
                self.isAnimate = false
            })
        }
        
    }
    
    func updateLayerAndViewWith(_ point: CGPoint) {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 100))
        path.addQuadCurve(to: CGPoint(x: screenWidth, y: 100), controlPoint: point)
        path.addLine(to: CGPoint(x: screenWidth, y: 0))
        path.close()
        shapeLayer.path = path.cgPath
        
        if !isAnimate {
            arcView.center = point
        }
    }
    
    func displayRun() {
        
        let layer = arcView.layer.presentation()
        if let pt = layer?.position {
            updateLayerAndViewWith(pt)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension UIColor {
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(hexColor: String) {
        
        // 存储转换后的数值
        var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
        
        // 分别转换进行转换
        Scanner(string: hexColor[0..<2]).scanHexInt32(&red)
        
        Scanner(string: hexColor[2..<4]).scanHexInt32(&green)
        
        Scanner(string: hexColor[4..<6]).scanHexInt32(&blue)
        
        self.init(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
    }
}

extension String {
    
    /// String使用下标截取字符串
    /// 例: "示例字符串"[0..<2] 结果是 "示例"
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return self[startIndex..<endIndex]
        }
    }
}



