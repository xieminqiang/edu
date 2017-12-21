//
//  QGCoursesListModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/15.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import  ObjectMapper
class QGCoursesListModel: Mappable {
    var coverURL: String?
    var coursesId: Int?
    var org_name: String?
    var teacher_experience: Int?
    var teacher_name: String?
    var type: Int?
    var title: String?
    var teacher_id:Int?
    var address: String?
    var section: String?
    var student_range: String?
    var class_price: String?
    var org_id:Int?
    var tagList:[QGTaglistModel]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        coverURL <- map["cover_path"]
        coursesId <- map["id"]
        teacher_experience <- map["teacher_experience"]
        teacher_name <- map["teacher_name"]
        type <- map["type"]
        title <- map["title"]
        teacher_id <- map["teacher_id"]
        address <- map["address"]
        student_range <- map["student_range"]
        class_price <- map["class_price"]
        org_id <- map["org_id"]
        section <- map["section"]
        org_name <- map["org_name"]
        tagList <- map["tagList"]
    }
}
