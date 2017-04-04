//
//  CakeProgressView.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/4/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CakeProgressView: UIView {

    //冷却时间
    fileprivate let cd: Int
    
    fileprivate lazy var label: UILabel = {
       
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return label
    }()
    
    fileprivate let timer = Timer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    
    
    init(frame: CGRect, cd: Int) {
        
        self.cd = cd
        
        super.init(frame: frame)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        
        
        label.frame = CGRect(x: 0, y: 0, width: width() / 3, height: width() / 3)
        label.center = center
        label.text = "\(cd)"
        addSubview(label)
    }
    
    @objc fileprivate func timerAction() {
        
        
    }
    
    deinit {
        
        timer.invalidate()
    }
    
}

class CakeProgress: UIView {
    
    var progress: CGFloat = 0.0 {
        didSet {
            
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        ctx?.setFillColor(UIColor.blue.cgColor)
        ctx?.setLineWidth(1)
        ctx?.move(to: CGPoint(x: width() / 2, y: height() / 2))
        ctx?.addLine(to: CGPoint(x: middleWidth(), y: 0))
        let endAngle = CGFloat(M_PI) * 2 * progress - CGFloat(M_PI) / 2
        
        ctx?.addArc(center: CGPoint(x: width() / 2, y: height() / 2), radius: width() / 2, startAngle: -CGFloat(M_PI) / 2, endAngle: endAngle, clockwise: true)
        ctx?.fillPath()
        
    }
}
