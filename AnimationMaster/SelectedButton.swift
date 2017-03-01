//
//  SelectedButton.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/1.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class SelectedButton: UIView {

    fileprivate let KSelectColor: (CGFloat,CGFloat,CGFloat) = (212, 236, 247)
    fileprivate let KDisSelectColor: (CGFloat,CGFloat,CGFloat) = (229, 229, 229)
    fileprivate let KBorderColor: (CGFloat,CGFloat,CGFloat) = (133, 194, 223)
    
    fileprivate var contentView: UIView!
    fileprivate var imageView: UIImageView!
    fileprivate var button: UIButton!
    
    fileprivate var isSelected: Bool = false {
        didSet {
            if isSelected {
                
                contentView.backgroundColor = UIColor(red: KSelectColor.0 / 255.0, green: KSelectColor.1 / 255.0, blue: KSelectColor.2 / 255.0, alpha: 1)
                imageView.isHidden = false
            }else {
                
                contentView.backgroundColor = UIColor(red: KDisSelectColor.0 / 255.0, green: KDisSelectColor.1 / 255.0, blue: KDisSelectColor.2 / 255.0, alpha: 1)
                imageView.isHidden = true
            }
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    fileprivate func setupUI() {
        
        //contentView
        contentView = UIView(frame: CGRect(x: 0.2 * width(), y: 0.2 * height(), width: 0.6 * width(), height: 0.6 * height()))
        
        contentView.backgroundColor = UIColor(red: KDisSelectColor.0 / 255.0, green: KDisSelectColor.1 / 255.0, blue: KDisSelectColor.2 / 255.0, alpha: 1)
        contentView.layer.borderColor = UIColor(red: KBorderColor.0 / 255.0, green: KBorderColor.1 / 255.0, blue: KBorderColor.2 / 255.0, alpha: 1).cgColor
        contentView.layer.borderWidth = 2
        contentView.layer.cornerRadius = width() / 10
        addSubview(contentView)
        
        //imageView
        imageView = UIImageView(frame: bounds)
        imageView.image = UIImage(named: "c")
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true
        addSubview(imageView)
        
        //button
        button = UIButton()
        button.frame = bounds
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        addSubview(button)
    }
    
    @objc fileprivate func buttonClick() {
        
        isSelected = !isSelected
    }
    
}
