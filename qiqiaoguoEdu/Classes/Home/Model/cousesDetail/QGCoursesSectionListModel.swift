//
//  QGCoursesSectionListModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import ObjectMapper
class QGCoursesSectionListModel: Mappable {
    
    
    var content:String?
    var begin_date:String?
    var id:Int?
    
    var start_time:Int?
    var end_time:String?

    required init?(map: Map) {
        
    }
    
   func mapping(map: Map) {
    id <- map["id"]
    begin_date <- map["begin_date"]
    content <- map["content"]
    start_time <- map["start_time"]
    end_time <- map["end_time"]
    }
    

}
