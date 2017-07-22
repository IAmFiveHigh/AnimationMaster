//
//  ScreenFoldAnimationController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/22.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ScreenFoldAnimationController: BaseViewController {

    fileprivate var img2: UIImage!
    fileprivate var bgView: UIView!
    
    var foldImageArray = [UIImageView]()
    var shadowArray = [UIView]()
    
    var isFold: Bool = false

    
    override func viewDidLoad() {
        super.viewDidLoad()

        let bgImageView = UIImageView(frame: UIScreen.main.bounds)
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.image = UIImage(named: "2.jpg")
        view.addSubview(bgImageView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "折叠", style: .plain, target: self, action: #selector(fold))
    }
    
    @objc fileprivate func fold() {
        
        if !isFold {
            
            //CGImageRef img = UIGetScreenImage();
            let rect = CGRect(x: 0, y: 64, width: screenWidth, height: screenHeight - 64)
            
            UIGraphicsBeginImageContext(UIScreen.main.bounds.size)
            self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let img = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            let a = img?.cgImage?.cropping(to: rect)
            img2 = UIImage(cgImage: a!)
            
            bgView = UIView(frame: rect)
            bgView.backgroundColor = UIColor.white
            view.addSubview(bgView)
            
            let height: CGFloat = 1 / 8
            let imageHeight = (screenHeight - 64) / 8
            for index in 0..<8 {
                
                let image = UIImageView(image: img2)
                image.layer.contentsRect = CGRect(x: 0, y: CGFloat(index) * height, width: 1, height: height)
                image.layer.anchorPoint = CGPoint(x: 0.5, y: index % 2 == 0 ? 0 : 1)
                image.frame = CGRect(x: 0, y: CGFloat(index) * imageHeight, width: screenWidth, height: imageHeight)
                bgView.addSubview(image)
                foldImageArray.append(image)
                
                if index % 2 == 0 {
                    
                    let view = UIView(frame: image.bounds)
                    view.backgroundColor = UIColor(hexColor: "000000")
                    view.alpha = 0
                    image.addSubview(view)
                    shadowArray.append(view)
                }
            }
            
            UIView.animate(withDuration: 1) {
                
                for (index, image) in self.foldImageArray.enumerated()  {
                    
                    image.layer.transform = self.config3DTransformWithRotateAngle(CGFloat(index % 2 == 0 ? -1 : 1) * 45.0)
                    
                }
                
                self.shadowArray.forEach({ (shadow) in
                    shadow.alpha = 0.2
                })
            }
            
            let barbutton = navigationItem.rightBarButtonItem?.customView as? UIButton
            barbutton?.setTitle("恢复", for: .normal)
            isFold = true
        }else {
            
            UIView.animate(withDuration: 1, animations: {
                
                self.shadowArray.forEach { (shadow) in
                    shadow.alpha = 0
                }
                
                for image in self.foldImageArray {
                    image.layer.transform = CATransform3DIdentity
                }
            }, completion: { (finish) in
                
                self.isFold = false
                let barbutton = self.navigationItem.rightBarButtonItem?.customView as? UIButton
                barbutton?.setTitle("折叠", for: .normal)
                self.bgView.removeFromSuperview()
            })
        }
    }
    
    func config3DTransformWithRotateAngle(_ angle: CGFloat) -> CATransform3D {
        
        var transform = CATransform3DIdentity
        
        transform.m34 = -1 / 1000
        
        let rotation = CATransform3DRotate(transform, angle / 180 * CGFloat.pi, 1, 0, 0)
        
        return rotation
    }


   

}
