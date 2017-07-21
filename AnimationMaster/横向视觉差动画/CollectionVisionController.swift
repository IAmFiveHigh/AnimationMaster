//
//  CollectionVisionController.swift
//  AnimationMaster
//
//  Created by 每天农资 on 2017/7/21.
//  Copyright © 2017年 我是五高你敢信. All rights reserved.
//

import UIKit

class CollectionVisionController: BaseViewController {

    fileprivate let collectionVisionCellID = "collectionVisionCellID"
    
    fileprivate let imageArray = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg",]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight)
        layout.scrollDirection = .horizontal
        
        let cl = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        cl.delegate = self
        cl.dataSource = self
        cl.isPagingEnabled = true
        
        return cl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createCollectionView()
    }
    
    fileprivate func createCollectionView() {
        
        collectionView.register(CollectionVisionCell.self, forCellWithReuseIdentifier: collectionVisionCellID)
        view.addSubview(collectionView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        navigationController?.navigationBar.isHidden = false
        
    }
   
}

extension CollectionVisionController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionVisionCellID, for: indexPath) as! CollectionVisionCell
        
        cell.img.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let cellArray = collectionView.visibleCells
        
        for cell in cellArray as! [CollectionVisionCell] {
            
            cell.cellOnCollectionView(collectionView, view: view)
        }
    }
}
