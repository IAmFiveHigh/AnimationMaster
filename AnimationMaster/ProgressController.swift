//
//  ProgressController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/27.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ProgressController: BaseViewController {

    var progress: ProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }

    fileprivate func setupUI() {
        
        progress = ProgressView(frame: CGRect(x: 0, y: 300, width: 200, height: 30), timeInterval: 1, text: "我是五高你敢信正在Coding", backColor: UIColor.green)
        progress.tag = 10
        view.addSubview(progress)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progress.timerStop()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        progress.timerContinue()
    }
    
}
