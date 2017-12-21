//
//  QGHomeRepositoryModel.swift
//  Demo
//
//  Created by Lukasz Mroz on 08.02.2016.
//  Copyright © 2016 Sunshinejr. All rights reserved.
//

import Foundation
import ObjectMapper


class  QGHomeRepositoryModel: Mappable {
    
    var CoursesList = [QGCoursesListModel]()
    var BannerList =  [QGBannerListModel]()
    var CateList =  [QGCateListModel]()

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
          CoursesList <- map["extra.courseList"]
           BannerList <- map["extra.bannerList"]
            CateList <- map["extra.cateList"]
    }
    
}
