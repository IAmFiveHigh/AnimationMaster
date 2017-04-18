//
//  LoadingImageController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/4/18.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class LoadingImageController: BaseViewController {

    lazy var loadingView = UIImageView(image: UIImage(named: "loading4_00000"))
    
    fileprivate var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupArray()
        
        setupUI()
    }

    fileprivate func setupArray() {
        
        DispatchQueue.global().async(execute: {
            
            for index in 000...174 {
                let string = NSString(format: "loading4_00%03d", index)
                self.imageArray.append(UIImage(named: string as String)!)
            }
        })
        
        
    }
    
    fileprivate func setupUI() {
        
        view.backgroundColor = UIColor.black
        
        setupImageView()
        
        setupButton()
    }
    
    //设置按钮
    fileprivate func setupButton() {
    
        let titles = ["开始loading", "暂停loading"]
        for index in 0..<2 {
            
            let button = UIButton(type: .custom)
            button.setTitle(titles[index], for: .normal)
            button.setTitleColor(UIColor.red, for: .normal)
            button.frame = CGRect(x: 0, y: 400, width: 80, height: 40)
            button.setCenterX(view.centerX() - 50 + 100 * CGFloat(index))
            button.tag = index + 10
            button.addTarget(self, action: #selector(buttonClick(sender:)), for: .touchUpInside)
            view.addSubview(button)
        }
    }
    
    @objc fileprivate func buttonClick(sender: UIButton) {
        
        switch sender.tag - 10 {
        case 0:
            beginAnimation()
        default:
            endAnimation()
        }
    }
    
    fileprivate func beginAnimation() {
        
        loadingView.isHidden = false
        loadingView.animationImages = imageArray
        loadingView.animationDuration = 8
        loadingView.animationRepeatCount = 0
        loadingView.startAnimating()
    }
    
    fileprivate func endAnimation() {
        
        loadingView.stopAnimating()
        loadingView.isHidden = true
    }
    
    //设置imageView
    fileprivate func setupImageView() {
        
        loadingView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        loadingView.center = view.center
        view.addSubview(loadingView)
        loadingView.isHidden = true
    }
}
