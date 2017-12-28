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
       var lineView5 = UIView()
      var nameLab = UILabel()
      var ageLab = UILabel()
      var ageCountLab = UILabel()
      var theatherLab = UILabel()
      var theatherNameLab = UILabel()
    
      var timeScheduleLab = UILabel()
      var timeImg = UIImageView()
      var theacherImg = UIImageView()
      var  timeRangLab = UILabel()
    
       var peopleLab = UILabel()
       var  peopleRangLab = UILabel()
       var adresslab = UILabel()
       var  orgAdresslab = UILabel()
    
    
      var  orgImg = UIImageView()
      var  orgName = UILabel()
      var  orgAdressImg = UIImageView()
      var  orgAdress = UILabel()
      var  orgSign = UILabel()
 
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        lineView.backgroundColor = QGAPPBackgroundColor
         lineView0.backgroundColor = QGAPPBackgroundColor
         lineView1.backgroundColor = QGAPPBackgroundColor
         lineView2.backgroundColor = QGAPPBackgroundColor
         lineView3.backgroundColor = QGAPPBackgroundColor
         lineView4.backgroundColor = QGAPPBackgroundColor
         lineView5.backgroundColor = QGAPPBackgroundColor
         nameLab.textColor = QGColor_333333
        
          nameLab.font = QGFont_PingFangSCLight(float: 18)
         ageLab.textColor = QGColor_999999
         ageLab.font = fontLab
         ageLab.text = "适学年龄"
        
         ageCountLab.textColor = QGColor_666666
         ageCountLab.font = fontLab
        
        theatherLab.textColor = QGColor_999999
        theatherLab.font = fontLab
        theatherLab.text = "主讲老师"
        
        theatherNameLab.textColor = QGColor_666666
        theatherNameLab.font = fontLab
        
        timeScheduleLab.textColor = QGColor_999999
        timeScheduleLab.font = fontLab
        timeScheduleLab.text = "时间安排"
        
        timeRangLab.textColor = QGColor_666666
         timeRangLab.font = fontLab
        
        peopleLab.textColor = QGColor_999999
        peopleLab.font = fontLab
        peopleLab.text = "人数限制"
        
        peopleRangLab.textColor = QGColor_666666
        peopleRangLab.font = fontLab
        
        
       adresslab.textColor = QGColor_999999
       adresslab.font = fontLab
       adresslab.text = "授课地点"
        
        orgAdresslab.textColor = QGColor_666666
        orgAdresslab.numberOfLines = 2
        orgAdresslab.font = fontLab
        
        timeImg.image = UIImage.init(named: "icon_cacalendar")
        theacherImg.image = UIImage.init(named: "icon_arrow_right")
        
        orgImg.layer.cornerRadius = 5
        orgImg.layer.masksToBounds = true
        orgImg.contentMode = UIViewContentMode.scaleAspectFill
         orgImg.clipsToBounds = true
        
        orgName.textColor = QGColor_333333
        orgName.font = QGFont_PingFangSCLight(float: 18)
        
        orgAdressImg.image = UIImage.init(named: "address_icon")
        orgAdress.textColor = QGColor_999999
        orgAdress.font = UIFont.systemFont(ofSize: 12)
        
        orgSign.textColor = QGColor_999999
        orgSign.font = fontLab
         contentView.addSubview(orgSign)
        contentView.addSubview(orgAdress)
        contentView.addSubview(orgAdressImg)
        contentView.addSubview(orgName)
        contentView.addSubview(orgImg)
        contentView.addSubview(timeImg)
        contentView.addSubview(theacherImg)
        contentView.addSubview(lineView)
        contentView.addSubview(lineView0)
        contentView.addSubview(lineView1)
        contentView.addSubview(lineView2)
        contentView.addSubview(lineView3)
        contentView.addSubview(lineView4)
        contentView.addSubview(lineView5)
        contentView.addSubview(nameLab)
        contentView.addSubview(ageLab)
        contentView.addSubview(ageCountLab)
        contentView.addSubview(theatherNameLab)
        contentView.addSubview(peopleLab)
        contentView.addSubview(peopleRangLab)
        contentView.addSubview(adresslab)
        contentView.addSubview(orgAdresslab)
        contentView.addSubview(timeRangLab)
        contentView.addSubview(timeScheduleLab)
        contentView.addSubview(theatherLab)
        lineView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(contentView)
            make.height.equalTo(fixH(floatHeight: 10))
        }
  
         nameLab.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(lineView.snp.bottom).offset(fixH(floatHeight: 15))
       
        }

        addurriculum(leftLab:  ageLab, rightLab:  ageCountLab, topView: nameLab, linView: lineView0 )
        addurriculum(leftLab: theatherLab, rightLab: theatherNameLab, topView: lineView0, linView: lineView1)
        
       
        theacherImg.sizeToFit()
        theacherImg.snp.makeConstraints { (make) in
                make.centerY.equalTo(theatherLab)
                make.right.equalTo(contentView).offset(-QGScreenMargin - 5)
            }
  
        addurriculum(leftLab: timeScheduleLab, rightLab: timeRangLab, topView: lineView1, linView: lineView2)
       
        timeImg.snp.makeConstraints { (make) in
            make.centerY.equalTo( timeScheduleLab)
            make.right.equalTo(contentView).offset(-QGScreenMargin - 5)
        }
        addurriculum(leftLab:peopleLab , rightLab: peopleRangLab, topView: lineView2, linView: lineView3)
        addurriculum(leftLab:adresslab, rightLab: orgAdresslab, topView: lineView3, linView: lineView4)
        lineView5.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView)
            make.top.equalTo(lineView4.snp.bottom).offset(-1)
            make.height.equalTo(fixH(floatHeight: 10))
          
            
        }
        
        orgImg.snp.makeConstraints { (make) in
             make.left.equalTo(contentView).offset(QGScreenMargin)
             make.top.equalTo(lineView5.snp.bottom).offset(fixH(floatHeight: 15))
             make.width.equalTo(fixW(floatWidth: 70))
             make.height.equalTo(fixW(floatWidth: 70))
             make.bottom.equalTo(contentView).offset(fixH(floatHeight: -15))
        }
        
    
        orgName.snp.makeConstraints { (make) in
            make.left.equalTo(orgImg.snp.right).offset(QGMarginW*2)
            make.top.equalTo(orgImg)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
        }
        
   
        
        orgSign.snp.makeConstraints { (make) in
            make.left.equalTo(orgName)
            make.top.equalTo(orgName.snp.bottom).offset(QGMarginW*2)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
        }
        orgAdressImg.sizeToFit()
        orgAdressImg.snp.makeConstraints { (make) in
            make.left.equalTo(orgSign)
            make.top.equalTo(orgSign.snp.bottom).offset(QGMarginW*2)
        }
        
        orgAdress.snp.makeConstraints { (make) in
            make.left.equalTo(orgAdressImg.snp.right).offset(2)
            make.top.equalTo(orgAdressImg)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
        }
    }
    
       func addurriculum(leftLab:UILabel,rightLab:UILabel,topView:UIView,linView:UIView )  {
        leftLab.sizeToFit()
        leftLab.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(topView.snp.bottom).offset(fixH(floatHeight: 15))
        }
       rightLab.snp.makeConstraints { (make) in
            make.left.equalTo(leftLab.snp.left).offset(QGMarginW*2 + ageLab.width)
            make.top.equalTo(leftLab)
            make.right.equalTo(contentView).offset(-QGScreenMargin -  20)
            
        }
        linView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.height.equalTo(fixH(floatHeight: 1))
            make.top.equalTo(rightLab.snp.bottom).offset(fixH(floatHeight: 15))
        }
  
    }
    var  model:QGClassRoomDetailModel? {
        
        didSet {
            if model != nil {
               nameLab.text = "课程安排"
                ageCountLab.text = model?.student_range
                theatherNameLab.text = model?.teacher_name
                timeRangLab.text = model?.section
                peopleRangLab.text = String.init(format: "%d", (model?.max_student_number)!) + "人"
                orgAdresslab.text = model?.address
                orgImg.kf.setImage(with: URL(string:(model?.org_head_img)!))
                orgName.text = model?.org_name
                orgSign.text = model?.org_signature
                orgAdress.text = model?.org_address
        
            }

            
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
