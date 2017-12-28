//
//  QGLoadWebView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGLoadWebView: UIWebView {
    //noData-icon
    var noImg = UIImageView()
 
    var nameLab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        
        nameLab.textColor = QGColor_999999
        nameLab.font = UIFont.systemFont(ofSize: 15)
        self.addSubview(noImg)
        self.addSubview(nameLab)
     
        
    }
    
    func noData(data:Bool)  {
       
        
        if  data == true {
            nameLab.text = "暂无详情"
            noImg.image = UIImage.init(named: "noData-icon")
            noImg.sizeToFit()
            nameLab.sizeToFit()
            noImg.x = self.width/2 - noImg.width/2
            noImg.y = self.height/2 - noImg.height/2
            nameLab.x = self.width/2 - nameLab.width/2
            nameLab.y =  noImg.maxY + 8
        }
        

       
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
