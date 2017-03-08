//
//  AvatarAnimationController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AvatarAnimationController: BaseViewController {

    fileprivate var imageView: UIImageView!
    
    fileprivate var blurEffectView: UIVisualEffectView!
    
    fileprivate var avatar: AvatarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        createImageView()
        
        createEffectView()
        
        createAvatar()
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        button.setCenterX(view.centerX())
        button.setCenterY(view.centerY() + 100)
        button.setTitle("dianwo", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc fileprivate func buttonClick() {
        
        blurEffectView.isHidden = false
        avatar.bubbleAction()
    }
    
    fileprivate func createImageView() {
        
        imageView = UIImageView(image: UIImage(named: "background.jpg"))
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
    }
    
    fileprivate func createEffectView() {
        
        let blurEffect = UIBlurEffect(style: .light)
        
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.alpha = 0.9
        blurEffectView.isHidden = true
        view.addSubview(blurEffectView)
    }
    
    fileprivate func createAvatar() {
        
        avatar = AvatarView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), image: "avatar.jpg", bubbleArray: ["111","1881","331","221"])
        avatar.setCenterX(view.centerX())
        avatar.setCenterY(120)
        view.addSubview(avatar)
        
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
