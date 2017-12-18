//
//  QGBtnTagView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/15.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit


let QGBtnTagViewH:CGFloat = 20

class QGBtnTagView: UIView {

    var buttonArr:NSMutableArray = []
  

    //添加子控制器
    func creatButton(dataArr:Array<String>)   {
   
        
        var upX: CGFloat = 0.0
        for i in 0..<dataArr.count {
           let str: String = dataArr[i]

            let sizeW:CGFloat = str.stringWithConstrainedWidth(height: QGBtnTagViewH, font:UIFont.boldSystemFont(ofSize: 14))
            ////NSLog(@"%f",size.height);
         
            let btn: UIButton = UIButton(type: .custom)
      
            btn.frame = CGRect(x: upX, y: 0, width: sizeW+10, height:QGBtnTagViewH)
            btn.layer.borderWidth = 1
            btn.layer.borderColor = QGlineBackgroundColor?.cgColor
            btn.layer.masksToBounds = true
            btn.layer.cornerRadius = btn.height/2
            btn.setTitleColor(QGColor_999999, for: UIControlState.normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 11)
            btn.setTitle(str, for: UIControlState.normal)
            upX += sizeW+20
            self.addSubview(btn)
        }
        
        
    }

    

    

    
}
