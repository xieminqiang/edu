//
//  QGCateListModel.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import ObjectMapper
class QGCateListModel: Mappable {
 
    var cateId: Int?
    var reid: Int?

  
    var logo: String?
    var name: String?
    var url: String?
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
   
        cateId <- map["id"]
        reid <- map["reid"]
         logo <- map["logo"]
        name <- map["name"]
    
    
    }
    

}
