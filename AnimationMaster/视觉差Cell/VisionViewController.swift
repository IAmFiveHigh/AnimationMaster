//
//  VisionViewController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class VisionViewController: BaseViewController {

    let visionCellID = "visionCellID"
    
    var imageArray = ["图层-5.jpg","图层-6.jpg","图层-7.jpg"]
    
    lazy var tableView: UITableView = {
       
        let tb = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: .plain)
        tb.delegate = self
        tb.dataSource = self
        tb.showsVerticalScrollIndicator = false
        tb.separatorStyle = .none
        return tb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createTableView()
    }


    fileprivate func createTableView() {
        
        view.addSubview(tableView)
        
        tableView.register(VisionCell.self, forCellReuseIdentifier: visionCellID)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scrollViewDidScroll(UIScrollView())
    }
    
}

extension VisionViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: visionCellID, for: indexPath) as! VisionCell
        
        cell.img.image = UIImage(named: imageArray[indexPath.row % 3])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let visionArray = tableView.visibleCells
        
        for cell in visionArray as! [VisionCell] {
            
            cell.cellOnTableView(tableView, did: view)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
}
