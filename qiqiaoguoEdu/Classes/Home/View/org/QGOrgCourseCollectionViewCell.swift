//
//  QGOrgCourseCollectionViewCell.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/29.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGOrgCourseCollectionViewCell: UICollectionViewCell {
    var OrgCourseIcon = UIImageView()
    var OrgCourseName = UILabel()
     var OrgCoursePrice = UILabel()
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        OrgCourseIcon.backgroundColor = UIColor.red
        OrgCourseName = UILabel.init()
        OrgCourseName.text = "889898989898989898989898989898989"
        OrgCourseName.font = UIFont.systemFont(ofSize: 13)
        OrgCourseName.textAlignment =  NSTextAlignment.center
        OrgCourseName.textColor = QGColor_333333
        self.addSubview(OrgCourseName)
        
       OrgCoursePrice.font = UIFont.systemFont(ofSize: 13)
       OrgCoursePrice.textAlignment =  NSTextAlignment.center
       OrgCoursePrice.textColor = QGColor_333333
        OrgCoursePrice.text = "889898989898989898989898989898989"
        self.addSubview(OrgCoursePrice)
        self.addSubview(OrgCourseIcon)
        OrgCourseIcon.snp.makeConstraints { (make) in
   
            make.top.equalTo(contentView).offset(fixW(floatWidth: 15))
            make.left.equalTo(contentView).offset(fixW(floatWidth: 10))
             make.right.equalTo(contentView).offset(fixW(floatWidth: -10))
            make.height.equalTo(fixH(floatHeight:90))
          
            
        }
        
        OrgCourseName.snp.makeConstraints { (make) in
            make.left.right.equalTo( OrgCourseIcon)
            make.top.equalTo(OrgCourseIcon.snp.bottom).offset(fixW(floatWidth: 5))
        }
        OrgCoursePrice.snp.makeConstraints { (make) in
            make.left.right.equalTo(OrgCourseIcon)
            make.top.equalTo(OrgCourseName.snp.bottom).offset(fixW(floatWidth: 2))
        }
     
        
    }
    
    func sendModel(model: QGCoursesListModel) {
        
        OrgCourseIcon.kf.setImage(with: URL(string:model.coverURL!))
        OrgCourseName.text = model.org_name
        OrgCoursePrice.text = "¥ " + model.class_price!
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
