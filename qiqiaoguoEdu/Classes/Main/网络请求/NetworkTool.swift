//
//  NetworkTool.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Moya
//import SVProgressHUD
//import SVProgressHUD
let BASE_URL = "http://api.edu.qiqiaoguo.com/Phone"

protocol NetworkToolProtocol {

    // 首页
    static func loadHomeDetail(platformId: Int, completionHandler: @escaping (_ follewDetail: QGHomeModel)->())

}

class NetworkTool: NetworkToolProtocol {

    class func loadHomeDetail(platformId: Int, completionHandler: @escaping (_ follewDetail: QGHomeModel)->()) {
        let url = BASE_URL + "/Home/getIndexV2"
        let params = ["platform_id": platformId]
        Alamofire.request(url, method: .get, parameters: params).responseJSON { (response) in

            if let value = response.result.value {
                let json = JSON(value)
                let followDetail = QGHomeModel(dict: json["extra"].dictionaryObject! as [String : AnyObject])
                 completionHandler(followDetail)
            }else {
                print("错误")
            }
        }
    }
}

    

