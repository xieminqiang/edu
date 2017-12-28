//
//  QGTeacherListModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import Foundation
import ObjectMapper

class QGTeacherListModel:  Mappable  {
    var teacherList = [QGTeacherListModel]()
    var courseList =  [QGCoursesListModel]()
    var orgItem  =  [QGCateListModel]()
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        teacherList <- map["extra.teacherList"]
       courseList <- map["extra.courseList"]
       orgItem <- map["extra.item"]
    }
}

