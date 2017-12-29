//
//  QGOrgItemModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import Foundation
import ObjectMapper

class QGOrgItemModel:Mappable  {
    var note: String?
    var teacher_count: Int?
    var service_id: Int?
    var isFollowed: Int?
   var address:String?
    var tagList: [QGTaglistModel]?
    var signature: String?
    var  head_img: String?
    var course_count:Int?
    var bg_img: String?
    var  sharUrl: String?
    var follower_count:Int?
    var org_id:Int?
    var  name: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        teacher_count <- map["teacher_count"]
        note <- map["note"]
        head_img <- map["head_img"]
        service_id <- map["service_id"]
        isFollowed <- map["isFollowed"]
        tagList <- map["tagList"]
        signature <- map["signature"]
        course_count <- map["course_count"]
        bg_img <- map["bg_img"]
        sharUrl <- map["sharUrl"]
        follower_count <- map["follower_count"]
        org_id <- map["org_id"]
        name <- map["name"]
        address <- map["address"]
    }
    
    
    
}

