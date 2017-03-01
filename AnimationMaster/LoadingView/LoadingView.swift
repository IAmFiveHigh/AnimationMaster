//
//  LoadingView.swift
//  LHCWaveView
//
//  Created by 我是五高你敢信 on 2017/1/14.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    var waveView: WaveView?
    
    fileprivate lazy var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "120x120-2"))
        return imageView
    }()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        layer.cornerRadius = width() / 2
        layer.masksToBounds = true
        
        imageView.frame = bounds
        addSubview(imageView)
        
        waveView = WaveView(frame: frame)
        
        guard let waveView = waveView else { return  }
        
        waveView.tag = 10
        backgroundColor = UIColor.white
        
        waveView.startLoading()
        
        addSubview(waveView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func stopCADisplay() {
        
        guard let waveView = waveView else { return  }

        waveView.endLoading()
    }

}
