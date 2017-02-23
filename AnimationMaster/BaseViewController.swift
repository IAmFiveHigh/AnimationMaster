//
//  BaseViewController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/23.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: 提示框
    func showAlertWithMessage(_ message: String) {
        
        let alertViewController = UIAlertController(title: "温馨提示", message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "确认", style: .cancel, handler: nil)
        
        alertViewController.addAction(alertAction)
        
        present(alertViewController, animated: true, completion: nil)
        
    }
}
