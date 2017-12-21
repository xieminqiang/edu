//
//  QGBannerListModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import ObjectMapper
class QGBannerListModel: Mappable {
    var status: String?
    var bannerId: Int?
    var channel_id: Int?
    var platform_id: Int?
    var sid:Int?
    var type: String?
    var cover: String?
    var url: String?

    var activity_id:Int?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        status <- map["status"]
        bannerId <- map["id"]
        channel_id <- map["channel_id"]
        platform_id <- map["platform_id"]
        sid <- map["sid"]
        type <- map["type"]
        activity_id <- map["activity_id"]
        cover <- map["cover"]
        url <- map["url"]
      
    }
    

    
    
}
