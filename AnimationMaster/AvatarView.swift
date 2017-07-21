//
//  AvatarView.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/3/8.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class AvatarView: UIView {

    private let margin: CGFloat = 5
    
    fileprivate let imageView: UIImageView
    
    /// 内圈
    fileprivate let secondFloor = UIView()
    /// 外圈
    fileprivate let thirdFloor = UIView()
    
    fileprivate var bubbleViewArray = [AvatarBubble]()
    
    /// 动画可执行
    fileprivate var actionAble: Bool = true
    
    var isUnfold: Bool = false {
        didSet {
            
            guard actionAble else {
                
                isUnfold = oldValue
                return
            }
            
            guard isUnfold != oldValue else {
                
                isUnfold = oldValue
                return
            }
            
            if isUnfold {
                
                bubbleAction()
            }else {
                
                bubbleActionCancel()
            }
        }
    }
    
    //气泡移动后位置的数组
    fileprivate var bubbleTmpPointArray = [CGPoint]()
    
    init(frame: CGRect, image: String, bubbleArray: [String]) {
        
        imageView = UIImageView(image: UIImage(named: image))
        
        super.init(frame: frame)
        
        createBubble(with: bubbleArray)
        
        setupUI()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        
        thirdFloor.frame = CGRect(x: 0, y: 0, width: width(), height: height())
        thirdFloor.layer.cornerRadius = width() / 2
        thirdFloor.layer.masksToBounds = true
        thirdFloor.center = center
        thirdFloor.backgroundColor = UIColor.clear
        thirdFloor.isHidden = true
        AvatarView.addEffect(thirdFloor, alpha: 0.6, style: .light)
        addSubview(thirdFloor)
        
        secondFloor.frame = CGRect(x: 0, y: 0, width: width() - margin * 2, height: height() - margin * 2)
        secondFloor.layer.cornerRadius = (width() - margin * 2) / 2
        secondFloor.layer.masksToBounds = true
        secondFloor.center = center
        secondFloor.backgroundColor = UIColor.clear
        secondFloor.isHidden = true
        AvatarView.addEffect(secondFloor, alpha: 0.8, style: .light)
        addSubview(secondFloor)
        
        imageView.frame = CGRect(x: 0, y: 0, width: width() - 4 * margin, height: height() - 4 * margin)
        imageView.center = center
        imageView.layer.cornerRadius = (width() - margin * 4) / 2
        imageView.layer.masksToBounds = true
        addSubview(imageView)
    }
    
    fileprivate func createBubble(with bubbleArray: [String]) {
        
        guard bubbleArray.count > 0 else {
            return
        }
        
        for title in bubbleArray {
            
            let bubble = AvatarBubble(frame: CGRect(x: 0, y: 0, width: 30, height: 30), text: title)
            
            //bubble添加到数组中
            bubbleViewArray.append(bubble)
            
            //bubble添加到视图上
            addSubview(bubble)
            
            //重设bubble的center为视图中心
            bubble.center = center
        }
    }
    
    //MARK: - 气泡展开
    fileprivate func bubbleAction()  {
        
        secondFloor.isHidden = false
        thirdFloor.isHidden = false
        
        //根据bubble数量获取分得的单位角度大小
        let unite = CGFloat(M_PI * 2 / Double(bubbleViewArray.count))
        
        //设置bubble抛出距离
        let length = width()
        
        //记录的角度
        var angle = unite

        //动画执行时不能接受新指令
        actionAble = false
        
        for bubble in bubbleViewArray {

            let pointX = sin(angle) * length + width() / 2
            let pointY = -cos(angle) * length + height() / 2
            
            //根据初始center和目的地point获取路径layer
            let layer = createBezier(originPoint: bubble.center, destinationPoint: CGPoint(x: pointX, y: pointY))
            
            //保存每个目的地point
            bubbleTmpPointArray.append(CGPoint(x: pointX, y: pointY))
            
            
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.duration = 0.5
            animation.path = layer.path
            animation.isRemovedOnCompletion = false
            animation.fillMode = kCAFillModeForwards
            bubble.layer.add(animation, forKey: nil)
            
            angle += unite
        }
        
        //动画执行完毕后重新可接受新指令
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            
            self.actionAble = true
        })
        
    }
    
    //MARK: - 气泡折叠收好
    fileprivate func bubbleActionCancel() {
        
        secondFloor.isHidden = true
        thirdFloor.isHidden = true
        
        //动画执行时不能接受新指令
        actionAble = false
        
        
        guard bubbleTmpPointArray.count > 0 else {
            return
        }
        
        for (index,bubble) in bubbleViewArray.enumerated() {
            
            let layer = createBezier(originPoint: bubbleTmpPointArray[index], destinationPoint: CGPoint(x: width() / 2, y: height() / 2))
            
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.duration = 0.5
            animation.path = layer.path
            animation.isRemovedOnCompletion = false
            animation.fillMode = kCAFillModeForwards
            bubble.layer.add(animation, forKey: nil)
        }
        
        bubbleTmpPointArray.removeAll()
        
        //动画执行完毕后重新可接受新指令
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5, execute: {
            
            self.actionAble = true
        })
    }
    
    //MARK: - 创建贝塞尔曲线返回路径Layer
    fileprivate func createBezier(originPoint: CGPoint, destinationPoint: CGPoint) -> CAShapeLayer{
        
        
        let path = UIBezierPath()
        path.move(to: originPoint)
        
        //计算出起点到目标点的向量
        var v1 = Vector2(x: Double(destinationPoint.x - originPoint.x), y: Double(destinationPoint.y - originPoint.y))
        
        //计算出顺时针90度后的向量
        var v2 = v1.anticlockwise90Angle()
        
        v1 = v1 * 0.25
        
        v2 = v2 * (0.25 * sqrt(3))
        
        //获取控制点向量
        let newV = v1 + v2 + Vector2(x: Double(originPoint.x), y: Double(originPoint.y))
        
        //创建控制点坐标
        let controlPoint = CGPoint(x: newV.x, y: newV.y)
        
        //绘制控制曲线
        path.addQuadCurve(to: destinationPoint, controlPoint: controlPoint)
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineWidth = 1
        layer.strokeColor = UIColor.blue.cgColor
        return layer
    }
    
    //MARK: - 为View添加毛玻璃效果
    static func addEffect(_ subView: UIView, alpha: CGFloat, style: UIBlurEffectStyle) {
        
        let blurEffect = UIBlurEffect(style: .light)
        
        let visualEffect = UIVisualEffectView(effect: blurEffect)
        visualEffect.frame = CGRect(x: 0, y: 0, width: subView.width(), height: subView.height())
        visualEffect.alpha = alpha
        subView.addSubview(visualEffect)
    }
}

class AvatarBubble: UIView {
    
    fileprivate var label: UILabel
    fileprivate let margin: CGFloat = 2
    fileprivate let text: String
    init(frame: CGRect, text: String) {
        
        label = UILabel()
        self.text = text
        label.text = text
        super.init(frame: frame)
        
        layer.cornerRadius = width() / 2
        layer.masksToBounds = true
        
        addEffect()
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addEffect() {
        
        //添加黑色半透明底视图
        let blackView = UIView(frame: bounds)
        blackView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        blackView.alpha = 0.2
        addSubview(blackView)
    }
    
    fileprivate func setupUI() {
        
        label.frame = bounds
        
        //设置labletext属性居中，字体颜色白色
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = UIColor.clear
        
        //根据传人text长度设置label的font大小
        let length = text.characters.count
        label.font = UIFont.systemFont(ofSize: (width() - margin * 2) / CGFloat(length))
        
        addSubview(label)
    }
}

struct Vector2 : Equatable {
    
    var x: Double
    var y: Double
    
    
    /// 顺时针90度向量
    ///
    /// - Returns: 顺时针90度向量
    func anticlockwise90Angle() -> Vector2 {
        
        let newX = y
        let newY = -x
        return Vector2(x: newX, y: newY)
    }
}

func == (left: Vector2, right: Vector2) -> Bool {
    
    return left.x == right.x && left.y == right.y
}

func * (left: Vector2, right: Double) -> Vector2 {
    
    return Vector2(x: left.x * right, y: left.y * right)
}

func + (left: Vector2, right: Vector2) -> Vector2 {
    
    return Vector2(x: left.x + right.x, y: left.y + right.y)
}

func - (left: Vector2, right: Vector2) -> Vector2 {
    
    return Vector2(x: left.x - right.x, y: left.y - right.y)
}

enum RotationDirection {
    case 顺时针
    case 逆时针
}


