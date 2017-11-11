//
//  ViewController.swift
//  AnimationMaster
//
//  Created by 我是五高你敢信 on 2017/2/22.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let cellColor: (CGFloat, CGFloat, CGFloat) = (245, 245, 245)
class ViewController: UIViewController {
    
    let cellIdentify = "cellIdentify"
    
    fileprivate lazy var tableView: UITableView = {
       let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        return tableView
    }()
    
    ///列表数据源
    fileprivate var dataArray = [ListModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        createModelArray()
        
        tableView.register(listCell.self, forCellReuseIdentifier: cellIdentify)
        
        view.addSubview(tableView)
        
    }
    
    /// 创建数据源
    fileprivate func createModelArray() {
        
        func add( _ controller: BaseViewController, name: String) {
            
            dataArray.append(ListModel(name: name, controller: controller))
        }
        
        add(CABaseController(), name: "基础动画")
        add(CAKeyFrameController(), name: "关键帧动画")
        add(AnimatCircleController(), name: "动画圆环")
        add(ProgressController(), name: "混色字进度动画")
        add(SelectButtonController(), name: "选中按钮动画")
        add(LoadingViewController(), name: "加载等待动画")
        add(NumberAnimationController(), name: "变化数值动画")
        add(AvatarAnimationController(), name: "头像下拉动画")
        add(CakeProgressController(), name: "饼状冷却进度动画")
        add(LoadingImageController(), name: "图片加载动画")
        add(BounceJellyAnimation(), name: "弹簧果冻动画")
        add(VisionViewController(), name: "视觉差动画")
        add(CollectionVisionController(), name: "横向视觉差动画")
        add(GradientLayerAnimaController(), name: "渐变Mask动画")
        add(GradientLabelAnimaController(), name: "渐变Label动画")
        add(WaterDropGatherAnimController(), name: "水滴汇聚动画")
        add(ScreenFoldAnimationController(), name: "百叶窗特效动画")
        add(FireEmitterViewController(), name: "烟花粒子特效")
        add(旋转loading图Controller(), name: "旋转loading")
        add(BaseViewController(), name: "暂时占位Cell")
        add(BaseViewController(), name: "暂时占位Cell")

    }
    
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath) as! listCell
        
        cell.setBackgroundColor(with: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row].name
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        navigationController?.pushViewController(dataArray[indexPath.row].controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        cell.textLabel?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        UIView.animateKeyframes(withDuration: 0.1, delay: 0.1, options: .allowUserInteraction, animations: {
            cell.textLabel?.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
    }
    
}

class listCell: UITableViewCell {
    
    fileprivate func setBackgroundColor(with indexPath: IndexPath) {
        
        if indexPath.row % 2 == 1 {
            
            contentView.backgroundColor = UIColor(red: cellColor.0 / 255.0, green: cellColor.1 / 255.0, blue: cellColor.2 / 255.0, alpha: 1)
            textLabel?.backgroundColor = UIColor(red: cellColor.0 / 255.0, green: cellColor.1 / 255.0, blue: cellColor.2 / 255.0, alpha: 1)
        }else {
            contentView.backgroundColor = UIColor.white
            textLabel?.backgroundColor = UIColor.white
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
//        super.setHighlighted(highlighted, animated: animated)
//        
//        if isHighlighted {
//            
//            let basicAnimation = CABasicAnimation(keyPath: "transform.scale")
//            basicAnimation.toValue = CGSize(width: 0.95, height: 0.95)
//            basicAnimation.duration = 0.1
//            basicAnimation.isRemovedOnCompletion = false
//            basicAnimation.fillMode = kCAFillModeForwards
//            textLabel?.layer.add(basicAnimation, forKey: nil)
//        }else {
//            
//            let spring = CABasicAnimation(keyPath: "transform.scale")
//            spring.toValue = CGSize(width: 1, height: 1)
//            spring.duration = 0.1
//            spring.isRemovedOnCompletion = false
//            spring.fillMode = kCAFillModeForwards
//            textLabel?.layer.add(spring, forKey: nil)
//        }
    }
}

struct ListModel {
    
    let name: String
    let controller: BaseViewController
    
    init(name: String, controller: BaseViewController) {
        self.name = name
        self.controller = controller
    }
}

