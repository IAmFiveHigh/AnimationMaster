//
//  VisionCell.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class VisionCell: UITableViewCell {

    var img: UIImageView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        selectionStyle = .none
        layer.masksToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    fileprivate func setupUI() {
        
        img = UIImageView(frame: CGRect(x: 0, y: -20, width: screenWidth, height: height() + 20 + 80))
        img.contentMode  = .scaleAspectFill
        
        contentView.addSubview(img)
        
        
    }
    
    func cellOnTableView(_ tb: UITableView, did scroller: UIView) {
        
        let rect = tb.convert(frame, to: scroller)
        
        let distanceY = scroller.centerY() - rect.minY
        
        let different = img.height() - height()
        
        let move = distanceY / scroller.height() * different
        
        img.setY(move - different / 2)
        
    }
    
    
}
