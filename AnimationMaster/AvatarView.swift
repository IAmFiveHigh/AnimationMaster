//
//  AvatarView.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    private let margin: CGFloat = 5
    
    fileprivate let imageView: UIImageView
    
    /// 内圈
    fileprivate let secondFloor = UIView()
    /// 外圈
    fileprivate let thirdFloor = UIView()
    
    init(frame: CGRect, image: String) {
        
        imageView = UIImageView(image: UIImage(named: image))
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        thirdFloor.frame = CGRect(x: 0, y: 0, width: width(), height: height())
        thirdFloor.layer.cornerRadius = width() / 2
        thirdFloor.layer.masksToBounds = true
        thirdFloor.center = center
        thirdFloor.backgroundColor = UIColor.clear
        thirdFloor.isHidden = true
        AvatarView.addEffect(thirdFloor, alpha: 0.6)
        addSubview(thirdFloor)
        
        secondFloor.frame = CGRect(x: 0, y: 0, width: width() - margin * 2, height: height() - margin * 2)
        secondFloor.layer.cornerRadius = (width() - margin * 2) / 2
        secondFloor.layer.masksToBounds = true
        secondFloor.center = center
        secondFloor.backgroundColor = UIColor.clear
        secondFloor.isHidden = true
        AvatarView.addEffect(secondFloor, alpha: 0.8)
        addSubview(secondFloor)
        
        imageView.frame = CGRect(x: 0, y: 0, width: width() - 4 * margin, height: height() - 4 * margin)
        imageView.center = center
        imageView.layer.cornerRadius = (width() - margin * 4) / 2
        imageView.layer.masksToBounds = true
        addSubview(imageView)
    }
    
    
    /// 为View添加毛玻璃效果
    ///
    /// - Parameters:
    ///   - subView: view
    ///   - alpha: 毛玻璃透明度
    static func addEffect(_ subView: UIView, alpha: CGFloat) {
        
        let blurEffect = UIBlurEffect(style: .light)
        
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        visualEffect.frame = CGRect(x: 0, y: 0, width: subView.width(), height: subView.height())
        visualEffect.alpha = alpha
        subView.addSubview(visualEffect)
    }
}

class AvatarBubble: UIView {
    
    
}
