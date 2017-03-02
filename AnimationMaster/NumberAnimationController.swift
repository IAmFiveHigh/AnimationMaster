//
//  NumberAnimationController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/1.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class NumberAnimationController: BaseViewController {

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let label = CountingLabel(frame: CGRect(x: 0, y: 0, width: 120, height: 100))
        label.center = view.center
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        label.textAlignment = .center
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 15)
        label.tag = 10
        view.addSubview(label)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let label = view.viewWithTag(10) as! CountingLabel
        label.countFrom(startValue: 0, to: 2000, with: 5)
    }

}
