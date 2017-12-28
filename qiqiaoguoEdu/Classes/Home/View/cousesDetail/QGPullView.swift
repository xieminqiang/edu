//
//  QGPullView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGPullView: UIView {
    var line1 = UIView()
    var line2 = UIView()
    var nameLab = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = QGAPPBackgroundColor
        line1.backgroundColor = QGlineBackgroundColor
        line2.backgroundColor = QGlineBackgroundColor
        
        nameLab.textColor = QGColor_999999
        nameLab.font = UIFont.systemFont(ofSize: 13)
        self.addSubview(line1)
        self.addSubview(line2)
        self.addSubview(nameLab)
     
        
    }
    func nameStr(str:String)  {
        nameLab.text = str;
        nameLab.sizeToFit()
        nameLab.center = self.center
        line1.width = fixW(floatWidth: 54)
        line1.height = 1
        line2.width = line1.width
        line2.height = 1
        line1.x = nameLab.x - fixW(floatWidth: 8) - line1.width
        line1.y = nameLab.y  +  nameLab.height/2
        line2.x = nameLab.maxX + fixW(floatWidth: 8)
        line2.y = line1.y
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
