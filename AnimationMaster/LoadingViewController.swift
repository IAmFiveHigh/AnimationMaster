//
//  LodingViewController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/1.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class LoadingViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let loading = LoadingView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        loading.center = view.center
        view.addSubview(loading)
    }

}
