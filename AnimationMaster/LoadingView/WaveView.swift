//
//  WaveView.swift
//  LHCWaveView
//
//  Created by 我是五高你敢信 on 2017/1/13.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class WaveView: UIView {

    var displayLink: CADisplayLink?
    
    let waveWidth: CGFloat
    let waveHeight: CGFloat
    let waveMid: CGFloat
    let angularSpeed: CGFloat
    let amplitude: CGFloat
    
    var phase: CGFloat = 0
    let phaseShift: CGFloat
    
    lazy var sinLayer: CAShapeLayer = { [weak self] in
        
        let sinLayer = CAShapeLayer()
        sinLayer.backgroundColor = UIColor.clear.cgColor
        sinLayer.frame = (self?.bounds)!
        
        return sinLayer
    }()
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "120x120-1"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        waveWidth = frame.width
        waveHeight = frame.height / 2
        waveMid = waveWidth / 2
        angularSpeed = 1.0
        amplitude = waveHeight * 0.2
        
        phaseShift = 10
        
        super.init(frame: frame)
        
        imageView.frame = bounds
        addSubview(imageView)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WaveView {
    
    fileprivate func setupUI() {
        
        layer.mask = sinLayer
        
        startLoading()
    }
    
    func startLoading() {
        
        displayLink = CADisplayLink(target: self, selector: #selector(updateWave))
        
        if let displayLink = displayLink {
            displayLink.add(to: RunLoop.current, forMode: .commonModes)
        }
        
    }
    
    func endLoading() {
        
        if let displayLink = displayLink {
            displayLink.invalidate()
        }
        
        
    }
    
    @objc fileprivate func updateWave() {
        
        phase += phaseShift
        sinLayer.path = bezierPathWithWave().cgPath
    }
    
    fileprivate func bezierPathWithWave() -> UIBezierPath {
        
        let path = UIBezierPath()
        var endX: CGFloat = 0
        
        let unitPi = CGFloat(.pi / 180.0)
        let unitWaveWidth = 360.0 / waveWidth
        
        for x in stride(from: 0, through: waveWidth, by: 1) {
            endX = x
            var y: CGFloat = 0
            
            let unitX = x * unitPi
            let rightOperands = phase * unitPi
            let leftOperands = angularSpeed * unitWaveWidth * unitX
            let result = leftOperands + rightOperands
            y = amplitude * CGFloat(sinf(Float(result))) + waveWidth / 2
            
            if x == 0 {
                path.move(to: CGPoint(x: x, y: y))
            }else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        
        let endY = bounds.height
        path.addLine(to: CGPoint(x: endX, y: endY))
        path.addLine(to: CGPoint(x: 0, y: endY))
        return path
    }
}
