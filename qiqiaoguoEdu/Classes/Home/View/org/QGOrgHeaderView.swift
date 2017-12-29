//
//  QGOrgHeaderView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/29.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGOrgHeaderView: UIView {
    var blur = UIBlurEffect()
      var effectview = UIVisualEffectView()
    var headBg = UIImageView()
    var headImg1 = UIImageView()
    var headImg = UIImageView()
    var nameLab = UILabel()
    var signLab = UILabel()
    var adressIcon = UIButton()
   
    var tagView = QGBtnTagView()
    
     var leftBtn = UIButton()
     var centerBtn = UIButton()
     var rightBtn = UIButton()
    
    var leftLab = UILabel()
    var centerLab = UILabel()
    var rightLab = UILabel()
     var lineView0 = UIView()
     var lineView1 = UIView()
    fileprivate lazy var blackView:UIView = {
        let  blackView = UIView()
        blackView.backgroundColor =  UIColor.init(hexString:"333333",alpha:0.4)
        leftBtn.setTitle("课程", for: UIControlState.normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
      
        centerBtn.setTitle("老师", for: UIControlState.normal)
        centerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        rightBtn.setTitle("粉丝", for: UIControlState.normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        
        leftLab.textColor =  UIColor.white
        centerLab.textColor = leftLab.textColor
        rightLab.textColor =  leftLab.textColor
        leftLab.font =  UIFont.systemFont(ofSize: 14)
         centerLab.font = leftLab.font
         rightLab.font = leftLab.font
        
        blackView.addSubview(leftLab)
        blackView.addSubview(centerLab)
        blackView.addSubview(rightLab)
        
        blackView.addSubview(leftBtn)
        blackView.addSubview(centerBtn)
        blackView.addSubview(rightBtn)
        lineView1.backgroundColor = UIColor.white
        lineView0.backgroundColor = UIColor.white
        blackView.addSubview(lineView0)
        blackView.addSubview(lineView1)
        return blackView
        }()
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        nameLab.font = UIFont.systemFont(ofSize: 16)
        nameLab.textColor = UIColor.white
        nameLab.textAlignment = NSTextAlignment.center
        signLab.font = UIFont.systemFont(ofSize: 11)
        signLab.textColor = UIColor.white
        signLab.numberOfLines = 2
        signLab.textAlignment = NSTextAlignment.center
        adressIcon.setImage(UIImage.init(named: "orgadress"), for: UIControlState.normal)
        adressIcon.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 0)
        adressIcon.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        blur = UIBlurEffect.init(style: UIBlurEffectStyle.light)
        effectview = UIVisualEffectView.init(effect: blur)
     
        
        headBg.addSubview(effectview)
        self.addSubview( headBg)
        self.addSubview(headImg1)
        headImg1.addSubview(headImg)
        self.addSubview(nameLab)
        self.addSubview(blackView)
        self.addSubview(adressIcon)
        self.addSubview(signLab)
        self.addSubview(tagView)

       
 
    }
    
    var orgItemModel:QGOrgItemModel? {
        
        
       didSet {
            
        if orgItemModel != nil {
            
           
            headBg.kf.setImage(with: URL(string:(orgItemModel?.bg_img)!))
             headImg.kf.setImage(with: URL(string:(orgItemModel?.head_img)!))
            signLab.text = orgItemModel?.signature
            nameLab.text = orgItemModel?.name
            leftLab.text = String.init(format: "%d", (orgItemModel?.course_count)!)
           centerLab.text = String.init(format: "%d", (orgItemModel?.teacher_count)!)
           rightLab.text = String.init(format: "%d", (orgItemModel?.follower_count)!)
            adressIcon.setTitle(orgItemModel?.address, for: UIControlState.normal)
            tagView.creatButton(dataArr: orgItemModel?.tagList)
            headImg1.width = fixW(floatWidth: 80)
            headImg1.height = headImg1.width
            headImg1.x = Screen_width/2 -  headImg1.width/2
            headImg1.y =  fixW(floatWidth: 38)
            headImg1.layer.cornerRadius = headImg1.height/2
            headImg1.layer.masksToBounds = true
            headImg1.backgroundColor = UIColor.init(white: 1, alpha: 0.4)
            
            headImg.x = fixW(floatWidth: 3)
            headImg.y = headImg.x
            headImg.width = headImg1.width - headImg.x * 2
            headImg.height =  headImg.width
            headImg.layer.cornerRadius = headImg.height/2
            headImg.layer.masksToBounds = true
            
         
            nameLab.sizeToFit()
            nameLab.width = Screen_width - QGScreenMargin * 2
            nameLab.x = QGScreenMargin
            nameLab.y = headImg1.maxY + fixW(floatWidth: 12)
           
            signLab.width = Screen_width - QGScreenMargin * 2
            signLab.sizeToFit()
            
            
            signLab.x = Screen_width/2 - signLab.width/2
            signLab.y = nameLab.maxY + fixW(floatWidth: 5)
            
            adressIcon.sizeToFit()
            adressIcon.width = Screen_width - QGScreenMargin * 2
            adressIcon.x = QGScreenMargin
            adressIcon.y = signLab.maxY + fixW(floatWidth: 5)
            
            
            blackView.x = 0
            blackView.y = adressIcon.maxY + fixW(floatWidth: 15)
            blackView.width = Screen_width
            blackView.height = fixW(floatWidth: 50)
        
            
            tagView.x = QGScreenMargin
            tagView.y = blackView.maxY + fixW(floatWidth: 15)
            tagView.width = Screen_width - QGScreenMargin * 2
            tagView.height = 20;
            headBg.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height: blackView.maxY)
            effectview.frame =  headBg.frame
            
            
       

            
            leftBtn.x = 0
            leftBtn.y = 0
            leftBtn.width = Screen_width/3
            leftBtn.height = blackView.height
            
            leftLab.sizeToFit()
            leftLab.x = leftBtn.width/2 - leftLab.width/2
            leftLab.y = fixW(floatWidth: 7)
            leftBtn.titleEdgeInsets = UIEdgeInsetsMake(signLab.height, 0, 0, 0)
            
            centerBtn.titleEdgeInsets =  leftBtn.titleEdgeInsets
            rightBtn.titleEdgeInsets =  leftBtn.titleEdgeInsets
              lineView0.x = leftBtn.maxX - 1;
              lineView0.y = fixW(floatWidth: 10)
              lineView0.height = fixW(floatWidth: 30)
              lineView0.width = 1
            
            centerBtn.x = leftBtn.maxX
            centerBtn.y = 0
            centerBtn.width = leftBtn.width
            centerBtn.height = leftBtn.height
            
            rightBtn.x = centerBtn.maxX
             rightBtn.y = 0
            rightBtn.width = leftBtn.width
            rightBtn.height = leftBtn.height
            
            lineView1.x = centerBtn.maxX - 1;
            lineView1.y = fixW(floatWidth: 10)
            lineView1.height = fixW(floatWidth: 30)
            lineView1.width = 1
           
             centerLab.sizeToFit()
             centerLab.x = centerBtn.maxX - rightBtn.width/2-leftLab.width/2
             centerLab.y = fixW(floatWidth: 7)
            
             rightLab.sizeToFit()
             rightLab.x = rightBtn.maxX - rightBtn.width/2-leftLab.width/2
             rightLab.y = fixW(floatWidth: 7)
          
            
        }
        }
      
        
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
