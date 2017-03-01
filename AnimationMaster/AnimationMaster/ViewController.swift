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
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentify)
        
        view.addSubview(tableView)
        
    }
    
    /// 创建数据源
    fileprivate func createModelArray() {
        
        func add( _ controller: BaseViewController, name: String) {
            
            dataArray.append(ListModel(name: name, controller: controller))
        }
        
        add(CABaseController(), name: "CABaseAnimation")
        add(CAKeyFrameController(), name: "CAKeyFrameAnimation")
        add(AnimatCircleController(), name: "CircleViewAnimation")
        add(ProgressController(), name: "ProgressViewAnimation")
        add(SelectButtonController(), name: "SelectButtonAnimation")
        add(LoadingViewController(), name: "LoadingViewAnimation")
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentify, for: indexPath)
        
        if indexPath.row % 2 == 1 {
            
            cell.contentView.backgroundColor = UIColor(red: cellColor.0 / 255.0, green: cellColor.1 / 255.0, blue: cellColor.2 / 255.0, alpha: 1)
            cell.textLabel?.backgroundColor = UIColor(red: cellColor.0 / 255.0, green: cellColor.1 / 255.0, blue: cellColor.2 / 255.0, alpha: 1)
        }
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
}

struct ListModel {
    
    let name: String
    let controller: BaseViewController
    
    init(name: String, controller: BaseViewController) {
        self.name = name
        self.controller = controller
    }
}

