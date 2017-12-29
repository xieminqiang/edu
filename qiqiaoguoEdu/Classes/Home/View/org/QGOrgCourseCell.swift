//
//  QGOrgCourseCell.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/29.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGOrgCourseCell: UITableViewCell {
    var courseList =  [QGCoursesListModel]()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
    }
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
          layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = .init(width:fixW(floatWidth: 144), height: fixW(floatWidth: 152))
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collection = UICollectionView.init(frame: .init(x: 0, y: 0, width: Screen_width ,height: fixW(floatWidth: 152)), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = UIColor.white
        collection.showsHorizontalScrollIndicator = false
        collection.showsVerticalScrollIndicator = false
        collection.register(QGOrgCourseCollectionViewCell.self, forCellWithReuseIdentifier: "QGOrgCourseCollectionViewCell")
        return collection
    }()
 
   
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension QGOrgCourseCell: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return courseList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QGOrgCourseCollectionViewCell", for: indexPath) as! QGOrgCourseCollectionViewCell
        let repo = courseList[(indexPath as NSIndexPath).row]

          cell.sendModel(model:repo)
      
        return cell
}
}
