//
//  CollectionVisionCell.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CollectionVisionCell: UICollectionViewCell {
    
    var img: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.masksToBounds = true
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        img = UIImageView(frame: CGRect(x: -50, y: 0, width: screenWidth + 100, height: height()))
        img.contentMode = .scaleAspectFill
        contentView.addSubview(img)
    }
    
    func cellOnCollectionView( _ collection: UICollectionView, view: UIView) {
        
        let rect = collection.convert(frame, to: view)
        
        let distanceX = view.centerX() - rect.minX
        
        let different = img.width() - width()
        
        let imgMove = distanceX / width() * different
        
        img.setX(imgMove - different / 2)
        
    }
}
