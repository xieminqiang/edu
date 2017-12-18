//
//  QGNetManager.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/22.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import Foundation
import Alamofire
private let NetRequestShareInstance = QGNetManager()
class QGNetManager: NSObject {
    class var sharedInstance : QGNetManager {
        return NetRequestShareInstance
    }
    
}

extension QGNetManager{
    
    func getRequest(urlString: String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->()) {
        
        
        Alamofire.request(urlString, method: .get, parameters: params)
            .responseJSON { (response) in
                
                if response.result.isSuccess{
                    
                    success(response.result.value as! [String : AnyObject])
                }else{
                    
                    print("error")
                }
        }
    }
    
}

