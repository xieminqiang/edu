//
//  QGNearCourseCell.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/22.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGNearCourseCell: UITableViewCell {
    var LeftImageView =  UIImageView()
    var rightImageView =  UIImageView()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        LeftImageView = UIImageView.init()
        LeftImageView.contentMode = UIViewContentMode.scaleAspectFill
        LeftImageView.clipsToBounds = true
        LeftImageView.image = UIImage.init(named: "near-couse-icon")
        rightImageView = UIImageView.init()
        rightImageView.contentMode = UIViewContentMode.scaleAspectFill
        rightImageView.clipsToBounds = true
        rightImageView.image = UIImage.init(named: "near-org-icon")
        contentView.addSubview(LeftImageView)
        contentView.addSubview(rightImageView)
        self.backgroundColor = QGAPPBackgroundColor
        LeftImageView.snp.makeConstraints { (make) in
            make.top.equalTo(fixH(floatHeight: 10))
            make.left.equalTo(contentView)
            make.height.equalTo(fixH(floatHeight: 78))
            make.width.equalTo(Screen_width/2-0.5)
            make.bottom.equalTo(fixH(floatHeight: -10))
        }
        
        rightImageView .snp.makeConstraints { (make) in
            make.top.equalTo(fixH(floatHeight: 10))
            make.right.equalTo(contentView)
            make.height.equalTo(fixH(floatHeight: 78))
            make.width.equalTo(Screen_width/2-0.5)
            make.bottom.equalTo(fixH(floatHeight: -10))
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
    
        
        
    }
  
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

}
