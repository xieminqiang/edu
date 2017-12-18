//
//  Define.swift
//  LCNM-Swift
//
//  Created by xieminqiang on 2017/3/7.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import Foundation
import UIKit

import SnapKit
//颜色
let QGColor_000000 = UIColor.init(hexString:"000000")
let QGColor_333333 = UIColor.init(hexString:"333333")
let QGColor_666666 = UIColor.init(hexString:"666666")
let QGColor_999999 = UIColor.init(hexString:"999999")
let QGColor_red = UIColor.init(hexString:"ff3859")
let QGAPPBackgroundColor = UIColor.init(hexString:"f5f5f5")
let QGlineBackgroundColor = UIColor.init(hexString:"c1c1c1")
let Screen_width = UIScreen.main.bounds.size.width
let Screen_height = UIScreen.main.bounds.size.height
// 导航栏高度
let kNavBarHeight: CGFloat = 64.0
// 导航栏高度
let kTabBarHeight: CGFloat = 49.0


func fixH(floatHeight:CGFloat) -> CGFloat {
  return  (floatHeight/736.0 * Screen_height)
}
let QGMarginH: CGFloat = fixH(floatHeight: 4)
func fixW(floatWidth:CGFloat) -> CGFloat {
    return  (floatWidth/414.0 * Screen_width)
}
// 边距
let QGScreenMargin: CGFloat = fixW(floatWidth: 15)

let QGMarginW: CGFloat = fixW(floatWidth: 4)



