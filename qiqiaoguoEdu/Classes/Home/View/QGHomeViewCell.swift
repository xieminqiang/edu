//
//  QGHomeViewCell.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/13.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

let viewFont:UIFont = UIFont.systemFont(ofSize: 12)


class QGHomeViewCell: UITableViewCell {
     var coursesIcon: UIImageView!
     var nameLabel: UILabel!
     var signLabel: UILabel!
     var adressLabel: UILabel!
     var adressIcon: UIImageView!
 
     var tagView = QGBtnTagView()
     var lineView: UIView!
     var ageName: UILabel!
     var ageText: UILabel!
     var organName: UILabel!
     var organText: UILabel!
     var timeName: UILabel!
     var timeText: UILabel!
     var lineView0: UIView!
      var lineView1: UIView!
      var priceText: UILabel!

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        coursesIcon = UIImageView.init()
        coursesIcon.contentMode = UIViewContentMode.scaleAspectFill
        coursesIcon.clipsToBounds = true
        nameLabel = UILabel.init()
        nameLabel.textColor = QGColor_333333
        nameLabel.font = UIFont.systemFont(ofSize: 16)

        signLabel = UILabel.init()
        signLabel.textColor = QGColor_999999
        signLabel.font = viewFont
        tagView = QGBtnTagView.init()
        
        adressLabel = UILabel.init()
        adressLabel.textColor = QGColor_999999
        adressLabel.font = UIFont.systemFont(ofSize: 11)
        
        adressIcon = UIImageView.init()
        lineView = UIView.init()
        lineView.backgroundColor = QGAPPBackgroundColor
        
        ageName = UILabel.init()
        ageName.textColor = QGColor_999999
        ageName.font = viewFont
        ageName.text = "适学年龄"
        
        ageText = UILabel.init()
        ageText.textColor = QGColor_666666
        ageText.font = viewFont
        
        
        organName = UILabel.init()
        organName.textColor = QGColor_999999
        organName.font = viewFont
        organName.text = "机构名称"
        
        organText = UILabel.init()
        organText.textColor = QGColor_666666
        organText.font = viewFont
        
        timeName = UILabel.init()
        timeName.textColor = QGColor_999999
        timeName.font = viewFont
        timeName.text = "时间安排"
        
        timeText = UILabel.init()
        timeText.textColor = QGColor_666666
        timeText.font = viewFont
        lineView0 = UIView.init()
        lineView0.backgroundColor = QGAPPBackgroundColor
        contentView.addSubview( lineView0)
        
        lineView1 = UIView.init()
        lineView1.backgroundColor = QGAPPBackgroundColor
        contentView.addSubview( lineView1)
        
        priceText = UILabel.init()
        priceText.textColor = QGColor_red
        priceText.font = UIFont.boldSystemFont(ofSize: 17)
        contentView.addSubview(priceText)
        contentView.addSubview(timeText)
        contentView.addSubview(timeName)

        contentView.addSubview(organText)
        contentView.addSubview(organName)
        contentView.addSubview(ageText)
        contentView.addSubview(ageName)
        contentView.addSubview(lineView)
        contentView.addSubview(adressIcon)
        contentView.addSubview(adressLabel)
        contentView.addSubview(tagView)
        contentView.addSubview(signLabel)
        contentView.addSubview(coursesIcon)
        contentView.addSubview(nameLabel)

        

        coursesIcon.snp.makeConstraints { (make) in
            make.left.equalTo(QGScreenMargin)
            make.height.equalTo( fixW(floatWidth: 145) * 0.625)
            make.top.equalTo( QGMarginH*3)
            make.width.equalTo(fixW(floatWidth: 145) )

        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(coursesIcon.snp.right).offset(QGMarginW*2)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.top.equalTo(coursesIcon)
        }

        signLabel.snp.makeConstraints { (make) in
            make.left.equalTo(nameLabel)
            make.right.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset( QGMarginH*2)
        }

        adressIcon.snp.makeConstraints { (make) in
            make.left.equalTo(signLabel)
            make.top.equalTo( signLabel.snp.bottom).offset( QGMarginH*2)
        }
        adressLabel.snp.makeConstraints { (make) in
            make.left.equalTo(adressIcon).offset(12)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.top.equalTo( signLabel.snp.bottom).offset( QGMarginH+2)
        }

       tagView.snp.makeConstraints { (make) in
            make.left.equalTo(signLabel)
            make.right.equalTo(signLabel)
            make.top.equalTo(coursesIcon.snp.bottom).offset( -QGBtnTagViewH)
        }
        lineView.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.height.equalTo(fixH(floatHeight: 1))
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.top.equalTo( coursesIcon.snp.bottom).offset( QGMarginH*5)
        }

        ageName.sizeToFit()
        ageName.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(lineView.snp.bottom).offset( QGMarginH*3)
        }

        ageText.snp.makeConstraints { (make) in
            make.left.equalTo(ageName).offset(fixW(floatWidth: 5) + ageName.width)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.top.equalTo(ageName)
        }

        organName.sizeToFit()
        organName.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(ageName.snp.bottom).offset(fixH(floatHeight: 7))
        }

        organText.snp.makeConstraints { (make) in
            make.left.equalTo(organName).offset(fixW(floatWidth: 5) + ageName.width)
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.top.equalTo(organName)
        }


        timeName.sizeToFit()
        timeName.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.top.equalTo(organName.snp.bottom).offset(fixH(floatHeight: 7))
        }

        timeText.snp.makeConstraints { (make) in
            make.left.equalTo(timeName).offset(fixW(floatWidth: 5) + timeName.width)
            make.right.equalTo(timeName).offset(-QGScreenMargin)
            make.top.equalTo(timeName)
        }
        lineView0.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.height.equalTo(fixH(floatHeight: 1))
            make.right.equalTo(contentView).offset(-QGScreenMargin)
            make.top.equalTo(timeText.snp.bottom).offset( QGMarginH*3)
        }
        priceText.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(QGScreenMargin)
            make.right.equalTo(timeName).offset(-QGScreenMargin)
            make.top.equalTo(lineView0.snp.bottom).offset( QGMarginH*4)
        }

        lineView1.snp.makeConstraints { (make) in
            make.left.right.equalTo(contentView)
            make.height.equalTo(fixH(floatHeight: 10))
            make.top.equalTo(priceText.snp.bottom).offset( QGMarginH*4)
            make.bottom.equalTo(0);
        }

        
  
    }
    
    func sendModel(model: QGCoursesListModel) {
        
        for son in tagView.subviews {
            son.removeFromSuperview()
        }
        
        adressIcon.image = UIImage.init(named: "address_icon")
        adressLabel.text = model.address
        tagView.creatButton(dataArr: model.tagList)
        coursesIcon.kf.setImage(with: URL(string:model.coverURL!))
        nameLabel.text = model.title
        let str = NSString.init(format: "  %d年教龄", model.teacher_experience!)
        signLabel.text = model.teacher_name! + (str as String)
        ageText.text = model.student_range
        organText.text = model.org_name
        timeText.text = model.section
        let price:String = "¥ "
        priceText.text = price + model.class_price!
      
        
    }
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!

    }
    
    override func layoutSubviews() {
 
   
    }
    override func awakeFromNib() {
        super.awakeFromNib()
   
    
    }
//    override func sizeThatFits(_ size: CGSize) -> CGSize {
//         print("56565656ffffffff",lineView1.maxY)
//          let sizeH = CGSize.init(width: Screen_width, height:300 )
//
//          return  sizeH
//    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


}
