//
//  String+Ext.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/15.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

extension NSAttributedString {
    func heightWithConstrainedWidth(width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.height
    }
    
    func widthWithConstrainedHeight(height: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, context: nil)
        
        return boundingBox.width
    }
}

extension String {
    
    
    
    func stringWithConstrainedheight(width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
          let attrs = [NSAttributedStringKey.font: font]
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin,.truncatesLastVisibleLine], attributes:attrs , context: nil)
        
        return boundingBox.height
    }
    func stringWithConstrainedWidth(height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let attrs = [NSAttributedStringKey.font: font]
        let boundingBox = self.boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin,.truncatesLastVisibleLine], attributes:attrs , context: nil)
        
        return boundingBox.width
    }
}
