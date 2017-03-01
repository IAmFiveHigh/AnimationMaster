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

        
        let button2 = SelectedButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        button2.setCenterX(view.center.x)
        button2.setCenterY(view.center.y - 100)
        view.addSubview(button2)
        
        let button1 = OpacityButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40), title: "opacityButton", titleColor: UIColor.white)
        button1.setCenterX(view.center.x)
        button1.setCenterY(view.center.y + 100)
        view.addSubview(button1)
    }

}
