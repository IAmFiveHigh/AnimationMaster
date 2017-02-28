//
//  ProgressController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/27.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ProgressController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        
    }

    fileprivate func setupUI() {
        
        let progress1 = ProgressView(frame: CGRect(x: 0, y: 300, width: 200, height: 30), timeInterval: 1, text: "我是五高你敢信正在Coding", backColor: UIColor.green)
        view.addSubview(progress1)
    }
    
}
