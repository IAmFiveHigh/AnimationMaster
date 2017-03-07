//
//  OpacityButton.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/28.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class OpacityButton: UIView {

    fileprivate var button: UIButton!
    fileprivate var contentLable: UILabel!
    
    fileprivate let title: String
    fileprivate let backColor: UIColor
    fileprivate let titleColor: UIColor
    fileprivate let fontSize: CGFloat
    
    init(frame: CGRect, title: String, titleColor: UIColor = UIColor.black, backColor: UIColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), fontSize: CGFloat = 12) {
        
        self.title = title
        self.backColor = backColor
        self.titleColor = titleColor
        self.fontSize = fontSize
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func setupUI() {
        
        contentLable = UILabel(frame: bounds)
        contentLable.text = title
        contentLable.textColor = titleColor
        contentLable.textAlignment = .center
        contentLable.font = UIFont.systemFont(ofSize: fontSize)
        contentLable.backgroundColor = backColor
        contentLable.layer.cornerRadius = 5
        contentLable.layer.masksToBounds = true
        addSubview(contentLable)
        
        button = UIButton()
        button.frame = bounds
        button.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
        button.addTarget(self, action: #selector(touchDragEnter), for: .touchDown)
        
        button.frame = bounds
        addSubview(button)
    }
    
    
    @objc fileprivate func touchUpInside() {
        
        contentLable.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.5, animations: {
            self.contentLable.alpha = 1
            self.contentLable.font = UIFont.systemFont(ofSize: self.fontSize)
        })
    }
    
    
    @objc fileprivate func touchDragEnter() {
        
        contentLable.layer.removeAllAnimations()
        UIView.animate(withDuration: 0.5, animations: {
            
            self.contentLable.alpha = 0.5
            self.contentLable.font = UIFont.systemFont(ofSize: self.fontSize + 1)

        })
    }

}
