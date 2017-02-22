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
    
    //FIXME:- 假数据
    fileprivate var dataArray = ["1", "2", "3", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentify)
        
        view.addSubview(tableView)
        
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
        }
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
}

