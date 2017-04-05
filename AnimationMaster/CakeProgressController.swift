//
//  CakeProgressController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/4/3.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CakeProgressController: BaseViewController {

    fileprivate let cake = CakeProgressView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), cd: 8)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cake.center = view.center
        cake.hasIndexLabel = true
        cake.layer.borderWidth = 1
        cake.layer.borderColor = UIColor.red.cgColor
        view.addSubview(cake)
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 80, height: 60)
        button.setCenterX(view.centerX())
        button.setCenterY(view.centerY() + 100)
        button.setTitle("clickMe", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        view.addSubview(button)
    }
    
    @objc fileprivate func buttonClick() {
        
        cake.colddown()
    }

    
}
