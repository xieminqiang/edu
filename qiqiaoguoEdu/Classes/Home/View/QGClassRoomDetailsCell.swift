//
//  QGClassRoomDetailsCell.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/25.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit


let fontLab = UIFont.systemFont(ofSize: 13)

class QGClassRoomDetailsCell: UITableViewCell {
      var lineView = UIView()
      var lineView0 = UIView()
      var lineView1 = UIView()
      var lineView2 = UIView()
      var lineView3 = UIView()
      var lineView4 = UIView()
      var nameLab = UILabel()
      var ageLab = UILabel()
      var ageCountLab = UILabel()
      var theatherLab = UILabel()
      var theatherNameLab = UILabel()
    //  var nameLab = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        lineView.backgroundColor = QGAPPBackgroundColor
         lineView0.backgroundColor = QGAPPBackgroundColor
         lineView1.backgroundColor = QGAPPBackgroundColor
         lineView2.backgroundColor = QGAPPBackgroundColor
         lineView3.backgroundColor = QGAPPBackgroundColor
         lineView4.backgroundColor = QGAPPBackgroundColor
        nameLab.textColor = QGColor_333333
        nameLab.font = UIFont.systemFont(ofSize: 18)
         ageLab.textColor = QGColor_999999
         ageLab.font = fontLab
         ageLab.text = "适学年龄"
        
         ageCountLab.textColor = QGColor_666666
         ageCountLab.font = fontLab
        
       theatherLab.textColor = QGColor_666666
       theatherLab.font = fontLab
       theatherLab.text = "适学年龄"
        
       theatherNameLab.textColor = QGColor_999999
       theatherNameLab.font = fontLab
        
        contentView.addSubview(lineView)
        contentView.addSubview(lineView0)
        contentView.addSubview(lineView1)
        contentView.addSubview(lineView2)
        
        contentView.addSubview(lineView3)
        contentView.addSubview(lineView4)
          contentView.addSubview(nameLab)
          contentView.addSubview(ageLab)
          contentView.addSubview(ageCountLab)
          contentView.addSubview(theatherNameLab)
        
           contentView.addSubview(theatherLab)
        lineView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(fixH(floatHeight: 10))
        }
  
       nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(lineView.snp.bottom).offset(fixH(floatHeight: 15))
       
        }
        ageLab.sizeToFit()
        ageLab.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            
            make.top.equalTo(nameLab.snp.bottom).offset(fixH(floatHeight: 15))
           // make.bottom.equalTo(contentView)
        }
       ageCountLab.snp.makeConstraints { (make) in
            make.left.equalTo(ageLab.snp.left).offset(QGMarginW*2 + ageLab.width)
            make.top.equalTo(ageLab)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
          //  make.bottom.equalTo(contentView)
        }
        lineView0.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.height.equalTo(fixH(floatHeight: 1))
            make.top.equalTo(ageLab.snp.bottom).offset(fixH(floatHeight: 15))
           
        }
        theatherLab.sizeToFit()
        theatherLab.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(lineView0.snp.bottom).offset(fixH(floatHeight: 15))
            make.bottom.equalTo(contentView)
        }
//        ageCountLab.snp.makeConstraints { (make) in
//            make.left.equalTo(ageLab.snp.left).offset(QGMarginW*2 + ageLab.width)
//            make.top.equalTo(ageLab)
//            make.right.equalTo(contentView).offset(QGScreenMargin)
//            //  make.bottom.equalTo(contentView)
//        }
        
    
    }
    var  model:QGClassRoomDetailModel? {
        
        
        didSet {
            
            if model != nil {
               nameLab.text = "课程安排"
              ageCountLab.text = "789789789789789789789789789789789789"
                
            }

            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
