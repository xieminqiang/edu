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
    
    
    var section:String?
    var class_end_date:String?
    var title:String?
    
    var org_address:String?
    var sign_status_text:String?
    var category_name:String?
    
    var service_id:Int?
    var class_start_date:String?
    var teacher_id:Int?
    
    var teacher_experience:Int?
    var type:Int?
    var teacher_name:String?
    
    var org_head_img:String?
    var max_student_number:Int?
    var course_desc:String?
    
    var avilibale_student_number:String?
    var student_range:String?
    var org_id:Int?
    
    var apply_student_number:Int?
    var sign_status:Int?
    var sid:Int?
    
    
    var isFollowed:Int?
    var createdate:String?
    var sharUrl:String?
    
    
    var address:String?
    var org_signature:String?
   var sectionList:[QGCoursesSectionListModel]?
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
          cover_path <- map["cover_path"]
          class_price <- map["class_price"]
          tagList <- map["tagList"]
          org_name <- map["org_name"]
         section <- map["section"]
        
        
        
        class_end_date <- map["class_end_date"]
        title <- map["title"]
        org_address <- map["org_address"]
       sign_status_text <- map["sign_status_text"]
       category_name <- map["category_name"]
        
        service_id <- map["service_id"]
        class_start_date <- map["class_start_date"]
        teacher_id <- map["teacher_id"]
        
       teacher_experience <- map["teacher_experience"]
        type <- map["type"]
        teacher_name <- map["teacher_name"]
        
        org_head_img <- map["org_head_img"]
       max_student_number <- map["max_student_number"]
        course_desc <- map["course_desc"]
        
        avilibale_student_number <- map["avilibale_student_number"]
        student_range <- map["student_range"]
         org_id <- map["org_id"]
        
        apply_student_number <- map["apply_student_number"]
       sid <- map["sid"]
       sign_status <- map["sign_status"]
        
        createdate <- map["createdate"]
        isFollowed <- map["isFollowed"]
         sharUrl <- map["sharUrl"]
        
        
        address <- map["address"]
        org_signature <- map["org_signature"]
       sectionList <- map["sectionList"]
        
    }
    
}
