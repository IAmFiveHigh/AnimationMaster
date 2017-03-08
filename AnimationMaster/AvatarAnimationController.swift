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
        blurEffectView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 400)
        blurEffectView.alpha = 1
        blurEffectView.isHidden = true
        view.addSubview(blurEffectView)
    }
    
    fileprivate func createAvatar() {
        
        avatar = AvatarView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), image: "avatar.jpg")
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
