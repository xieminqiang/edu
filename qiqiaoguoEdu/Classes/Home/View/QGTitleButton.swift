//
//  QGTitleButton.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/22.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGTitleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.imageView?.contentMode = UIViewContentMode.center
        self.titleLabel?.textAlignment = NSTextAlignment.right
        self.setTitleColor(UIColor.black, for: UIControlState.normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let imageY:CGFloat = 0
        let imageW:CGFloat = self.height
        let imageH:CGFloat = imageW
        let imageX:CGFloat = self.width - imageW - 5
        return CGRect.init(x: imageX, y: imageY, width: imageW, height: imageH)
    }
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let titleX:CGFloat = 0
        let titleY:CGFloat = 0
        let titleH:CGFloat = self.height
        let titleW:CGFloat = self.width - self.height - 5
        return CGRect.init(x: titleX, y: titleY, width: titleW, height: titleH)
    }
    override func setTitle(_ title: String?, for state: UIControlState) {
        super.setTitle(title, for: state)
        self.width = (title?.stringWithConstrainedWidth(height: fixH(floatHeight: 25), font: self.titleLabel!.font))! + self.height + fixW(floatWidth: 10)
      
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
