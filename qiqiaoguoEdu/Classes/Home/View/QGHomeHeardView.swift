//
//  QGHomeHeardView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/22.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import SDCycleScrollView
class QGHomeHeardView: UIView {
    var catList = [QGCateListModel]()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = .init(width:Screen_width/4, height: fixH(floatHeight:90))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView.init(frame: .init(x: 0, y: cycleScrollView.maxY, width: self.width ,height: self.height), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.bounces = false
        collection.register(QGCateListCollectionViewCell.self, forCellWithReuseIdentifier: "QGCateListCollectionViewCell")
        return collection
    }()
    
    lazy var cycleScrollView: SDCycleScrollView = {
        
        let cycleScrollView = SDCycleScrollView.init()
        cycleScrollView.autoScrollTimeInterval = 3
        cycleScrollView.pageDotColor = UIColor.init(white: 1, alpha: 0.4)
        cycleScrollView.pageControlDotSize = CGSize.init(width: 5, height: 5)
        return cycleScrollView
        
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(cycleScrollView)
        self.addSubview(collectionView)
        cycleScrollView.snp.makeConstraints { (make) in
           make.left.right.top.equalTo(self)
           make.height.equalTo(Screen_width*0.628)
        }
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(cycleScrollView.snp.bottom)
            make.left.right.equalTo(self)
            make.bottom.equalToSuperview()
        }
    
        
    }
    func catlittModel(model:[QGCateListModel]) {
       
        if model.count > 0 {
             self.catList = model
             collectionView.reloadData()
        }
       
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
extension QGHomeHeardView: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(self.catList)
        return self.catList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QGCateListCollectionViewCell", for: indexPath) as! QGCateListCollectionViewCell
        let repo = catList[(indexPath as NSIndexPath).row]
        cell.sendModel(model:repo)
        
        return cell
    }
    
    
}
