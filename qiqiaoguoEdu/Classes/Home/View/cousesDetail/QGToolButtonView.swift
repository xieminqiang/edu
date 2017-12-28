//
//  QGToolButtonView.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGToolButtonView: UIView {
    var leftBtn = QGToolButton()
    var centerBtn = QGToolButton()
    var rightBtn = QGToolButton()
    var line = UIView()
    var isCollection = Bool()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        line.backgroundColor = QGAPPBackgroundColor
        
        leftBtn.setTitle("咨询", for: UIControlState.normal)
        centerBtn.setTitle("收藏", for: UIControlState.normal)
        centerBtn.setTitle("已收藏", for: UIControlState.selected)
        rightBtn.setTitle("分享", for: UIControlState.normal)
        leftBtn.setImage(UIImage.init(named: "teather_consult"), for: .normal)
        centerBtn.setImage(UIImage.init(named: "teather_nolove"), for: .normal)
        centerBtn.setImage(UIImage.init(named: "teather_yeslove"), for: .selected)
        rightBtn.setImage(UIImage.init(named: "teather_share"), for: .normal)
        self.addSubview(leftBtn)
        self.addSubview(centerBtn)
        self.addSubview(rightBtn)
        self.addSubview(line)
        
 
        line.frame = CGRect.init(x: 0, y: 0, width: self.width, height: 1)
        leftBtn.x = 10
        leftBtn.y = line.maxY
        leftBtn.width = (self.width - 20)/3
        leftBtn.height = self.height
        
        centerBtn.x = leftBtn.maxX
        centerBtn.y = leftBtn.y
        centerBtn.width = leftBtn.width
        centerBtn.height = leftBtn.height
        
        rightBtn.x = centerBtn.maxX
        rightBtn.y = leftBtn.y
        rightBtn.width = leftBtn.width
        rightBtn.height = leftBtn.height
        self.isCollection = centerBtn.isSelected
        
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
