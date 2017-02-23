//
//  ListModel.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/23.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class ListModel: NSObject {
    
    let name: String
    let controller: BaseViewController
    
    init(name: String, controller: BaseViewController) {
        self.name = name
        self.controller = controller
    }
}
