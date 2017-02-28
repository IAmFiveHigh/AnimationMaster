//
//  SelectButtonController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/28.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class SelectButtonController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let button = OpacityButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40), title: "opacityButton", titleColor: UIColor.white)
        button.center = view.center
        view.addSubview(button)
    }

}
