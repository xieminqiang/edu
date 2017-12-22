//
//  QGCateListView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit



class QGCateListView: UIView {

    var catList = [QGCateListModel]()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = .init(width:Screen_width/4, height: fixH(floatHeight:90))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView.init(frame: .init(x: 0, y: 0, width: self.width ,height: self.height), collectionViewLayout: layout)
        
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.bounces = false
        collection.register(QGCateListCollectionViewCell.self, forCellWithReuseIdentifier: "QGCateListCollectionViewCell")
        return collection
    }()
   
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
    
         self.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(self)

        }
      
    }
    func catlittModel(model:[QGCateListModel]) {
        self.catList = model
     
        collectionView.reloadData()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


  

}
extension QGCateListView: UICollectionViewDelegate,UICollectionViewDataSource {
    
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
//       cell.sendModel(model:self.ca)
        cell.backgroundColor = UIColor.red
        cell.sendModel(model:repo)
        
        return cell
    }
    
    
}
