//
//  QGNavView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/22.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGNavView: UIView {
    
         var searchBg = UIView()
         var searchImg = UIImageView()
         var searchStr = UILabel()
    
         var leftBtn =  QGTitleButton()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        leftBtn.height = fixH(floatHeight: 25)
        leftBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        searchBg.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
        searchBg.layer.masksToBounds = true
        searchBg.layer.cornerRadius = 5
        
        searchStr.textColor = UIColor.white
        searchStr.font = UIFont.systemFont(ofSize: 14)
        
        searchImg.image = UIImage.init(named: "icon_search_home")
        
        
        searchBg.addSubview(searchImg)
        searchBg.addSubview(searchStr)
        self.addSubview(leftBtn)
        self.addSubview(searchBg)
    


        searchStr.text = "搜索 课程/机构"
        leftBtn.setImage(UIImage.init(named: "icon_city_home"), for: UIControlState.normal)
      
 
        
    }
    
    func adressName(nameStr:String)  {
        leftBtn.setTitle(nameStr, for: .normal)
        leftBtn.x = QGScreenMargin
        leftBtn.y = CGFloat(kNavBarBottom)-10 - leftBtn.height
        
        
        searchBg.height = fixH(floatHeight: 30);
        searchBg.center = leftBtn.center
        searchBg.x = leftBtn.maxX
        searchBg.width = Screen_width - searchBg.x - QGScreenMargin
        
        searchImg.sizeToFit()
        searchImg.x = 7;
        searchImg.y = searchBg.height/2 - searchImg.height/2
        
        searchStr.sizeToFit()
        searchStr.center = searchImg.center
        searchStr.x = searchImg.maxX + 5
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
