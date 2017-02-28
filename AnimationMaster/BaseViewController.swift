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

        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

    //MARK: 提示框
    func showAlertWithMessage(_ message: String) {
        
        let alertViewController = UIAlertController(title: "温馨提示", message: message, preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "确认", style: .cancel, handler: nil)
        
        alertViewController.addAction(alertAction)
        
        present(alertViewController, animated: true, completion: nil)
        
    }
}

extension UIView {
    //MARK: -UIView 的扩展
    
    //size
    func viewSize() -> CGSize {
        return frame.size
    }
    
    func setViewSize(_ viewSize: CGSize) {
        frame.size = viewSize
    }
    
    //origin
    func origin() -> CGPoint {
        return frame.origin
    }
    
    func setOrigin(origin:CGPoint) {
        frame.origin = origin
    }
    
    //x
    func x() -> CGFloat {
        return frame.origin.x
    }
    
    func setX(_ x: CGFloat) {
        frame.origin.x = x
    }
    
    //y
    func y() -> CGFloat {
        return frame.origin.y
    }
    
    func setY(_ y: CGFloat) {
        frame.origin.y = y
    }
    
    //width
    func width() -> CGFloat {
        return frame.size.width
    }
    
    func setWidth(_ width: CGFloat) {
        frame.size.width = width
    }
    
    //height
    func height() -> CGFloat {
        return frame.size.height
    }
    
    func setHeight(_ height: CGFloat) {
        frame.size.height = height
    }
    
    //top
    func top() -> CGFloat {
        return frame.origin.y
    }
    
    func setTop(_ top: CGFloat) {
        frame.origin.y = top
    }
    
    //bottom
    func bottom() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    
    func setBottom(_ bottom: CGFloat) {
        frame.origin.y = bottom - self.height()
    }
    
    //left
    func left() -> CGFloat {
        return frame.origin.x
    }
    
    func setLeft(_ left: CGFloat) {
        frame.origin.x = left
    }
    
    //right
    func right() -> CGFloat {
        return self.x() + self.width()
    }
    
    func setRight(_ right: CGFloat) {
        frame.origin.x = right - self.width()
    }
    
    //centerX
    func centerX() -> CGFloat {
        return center.x
    }
    
    func setCenterX(_ centerX: CGFloat) {
        center.x = centerX
    }
    
    //centerY
    func centerY() -> CGFloat {
        return center.y
    }
    
    func setCenterY(_ centerY: CGFloat) {
        center.y = centerY
    }
    
    //middleWidth
    func middleWidth() -> CGFloat {
        return self.width() / 2
    }
    
    //middleHeight
    func middleHeight() -> CGFloat {
        return self.height() / 2
    }
}
