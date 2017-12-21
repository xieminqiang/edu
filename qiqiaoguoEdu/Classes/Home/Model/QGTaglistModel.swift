//
//  QGTaglistModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import ObjectMapper

class QGTaglistModel: Mappable {

    var tag_name:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {

        tag_name <- map["tag_name"]
    }
}
