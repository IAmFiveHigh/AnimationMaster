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
        
        let button3 = HighlightButton(type: .custom)
        button3.frame = CGRect(x: 0, y: 0, width: 100, height: 60)
        button3.setTitle("highlight", for: .normal)
        button3.setTitleColor(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), for: .normal)
        button3.setCenterX(button1.centerX())
        button3.setCenterY(button1.centerY() + 100)
        button3.titleLabel?.textAlignment = .center
        view.addSubview(button3)
    }

}
