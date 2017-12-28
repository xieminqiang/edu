//
//  QGToolButton.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGToolButton: UIButton {
    var BtnSize = CGSize()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.setTitleColor(QGColor_666666, for: UIControlState.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageY:CGFloat = 8
        let imageW:CGFloat = 24
        let imageH:CGFloat = 23
        let imageX:CGFloat = self.width/2 - imageW/2
        return CGRect.init(x: imageX, y: imageY, width: imageW, height: imageH)
    }
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX:CGFloat = 0
   
        let titleH:CGFloat = self.BtnSize.height
        let titleY:CGFloat = self.height - 5 - titleH
        let titleW:CGFloat = self.width
        return CGRect.init(x: titleX, y: titleY, width: titleW, height: titleH)
    }
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: state)
        BtnSize = (title?.stringWithConstrainedSize(width: 100, height: 25, font: (self.titleLabel?.font)!))!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
