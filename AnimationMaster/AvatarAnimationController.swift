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
        
        createSwipGuesture()
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
        blurEffectView.alpha = 1
        blurEffectView.isHidden = true
        view.addSubview(blurEffectView)
    }
    
    fileprivate func createAvatar() {
        
        avatar = AvatarView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), image: "avatar.jpg", bubbleArray: ["游戏","宅","漫画","电影","轻小说"])
        avatar.setCenterX(view.centerX())
        avatar.setCenterY(120)
        view.addSubview(avatar)
        
    }
    
    fileprivate func createSwipGuesture() {
        
        let gestureDown = UISwipeGestureRecognizer(target: self, action: #selector(avatarDown))
        gestureDown.direction = .down
        view.addGestureRecognizer(gestureDown)
        
        let gestureUp = UISwipeGestureRecognizer(target: self, action: #selector(avatarUp))
        gestureUp.direction = .up
        view.addGestureRecognizer(gestureUp)
    }
    
    @objc fileprivate func avatarDown() {
        
        print("down")
        
        UIView.animate(withDuration: 1, animations: { [weak self] in
            
            self?.avatar.setCenterY((self?.view.centerY())!)
            self?.blurEffectView.isHidden = false
            
            self?.view.isUserInteractionEnabled = false
            }, completion: { isCompletion in
                
                self.avatar.isUnfold = true
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
                    
                    self.view.isUserInteractionEnabled = true
                })
        })
        
    }
    
    @objc fileprivate func avatarUp() {
        
        print("up")
        
        UIView.animate(withDuration: 1, animations: { [weak self] in
            
            self?.avatar.setCenterY(120)
            self?.avatar.isUnfold = false
            
            self?.view.isUserInteractionEnabled = false
            }, completion: { isCompletion in
                
                self.blurEffectView.isHidden = true
                self.view.isUserInteractionEnabled = true
        })
        
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
