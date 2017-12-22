//
//  QGCateListCollectionViewCell.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import SDWebImage
class QGCateListCollectionViewCell: UICollectionViewCell {
    var cateIcon = UIImageView()
    var cateName = UILabel()
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        cateIcon = UIImageView.init()
        cateName = UILabel.init()
        cateName.font = UIFont.systemFont(ofSize: 13)
        cateName.textAlignment =  NSTextAlignment.center
        cateName.textColor = QGColor_666666
        self.addSubview(cateName)
        self.addSubview(cateIcon)
        cateIcon.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(fixH(floatHeight: 20))
            make.height.equalTo(fixH(floatHeight: 50))
            make.width.equalTo(fixH(floatHeight: 50))
            
            
        }
        cateName.snp.makeConstraints { (make) in
            make.right.left.bottom.equalTo(self)
        }
     
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func sendModel(model: QGCateListModel) {

    
        cateIcon.kf.setImage(with: URL(string:model.logo!))
        cateName.text = model.name
    }
    
}
