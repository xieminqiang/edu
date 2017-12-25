//
//  QGClassRoomHeaderView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/25.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGClassRoomHeaderCell: UITableViewCell {
       var headImg = UIImageView()
        var nameLab = UILabel()
        var priceLab = UILabel()
        var tagView = QGBtnTagView()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:  reuseIdentifier)
        
         headImg.contentMode = UIViewContentMode.scaleAspectFill
         headImg.clipsToBounds = true
         contentView.addSubview(headImg)
         contentView.addSubview(nameLab)
         contentView.addSubview(priceLab)
         contentView.addSubview(tagView)
        
        headImg.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(contentView)
            make.height.equalTo(Screen_width*0.625)
        }
        nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(QGScreenMargin)
            make.top.equalTo(headImg).offset(fixH(floatHeight: 20))
           
        }
        priceLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(QGScreenMargin)
            make.top.equalTo(nameLab).offset(fixH(floatHeight: 8))
            
        }
        tagView.snp.makeConstraints { (make) in
            make.left.right.equalTo(QGScreenMargin)
            make.top.equalTo(priceLab).offset(fixH(floatHeight: 8))
               make.bottom.equalTo(contentView).offset(fixH(floatHeight: 20))
        }
        
        
    }

    var  model:QGClassRoomDetailModel? {
  
   
              didSet {
       
                
                headImg.kf.setImage(with: URL(string:(model?.cover_path)!))
                
    }
    }
//    func sendModel(model: QGClassRoomDetailModel!) {
//
//        print(model.cover_path)
//    }
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        
    }
}
