//
//  QGClassRoomModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/25.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import Foundation
import ObjectMapper
class QGClassRoomModel: Mappable {

    var itemD:QGClassRoomDetailModel!
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {

        itemD <- map["extra.item"]
    }
    
}


class QGClassRoomDetailModel: Mappable {
    
     var cover_path:String?
      var class_price:String?
      var org_name:String?
     var tagList:[QGTaglistModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
          cover_path <- map["cover_path"]
          class_price <- map["class_price"]
          tagList <- map["tagList"]
          org_name <- map["org_name"]
//         cover_path <- map["cover_path"]
    }
    
}
