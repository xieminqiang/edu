//
//  QGNetAPI.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/20.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import Foundation
import RxSwift
import Moya
private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

let gitHubProvider = MoyaProvider<QGNetAPI>(plugins: [NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)])
//let gitHubProvider = MoyaProvider<QGNetAPI>()

public enum QGNetAPI {
    case loadHomeData(Int)
    case loadCourseDetail(Int)
    case loadOrgDetail(Int)
}
extension Moya.Response {
    func mapNSArray() throws -> NSDictionary{
        let any = try self.mapJSON()
        guard let array = any as? NSDictionary else {
            throw MoyaError.jsonMapping(self)
        }
        return array
    }
}
extension QGNetAPI:TargetType {
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
   
      return "successfully".data(using: String.Encoding.utf8)!
  
        
        
    }
    
    public var task: Task {
        switch self {
        case .loadHomeData(let platform_id):
            return .requestParameters(parameters: ["platform_id": (platform_id)], encoding: URLEncoding.default)
        case .loadCourseDetail(let course_id):
            return .requestParameters(parameters: ["course_id": (course_id)], encoding: URLEncoding.default)
        case .loadOrgDetail(let org_id):
            return .requestParameters(parameters: ["org_id": (org_id)], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
       return nil
    }
    
  
    
  //  public var baseURL: URL { return URL(string: "http://api.edu.blue69.cn/Phone")! }
    
    public var baseURL: URL { return URL(string: "http://api.edu.qiqiaoguo.com/Phone")! }
    
    public var path: String {
        switch self {
        case .loadHomeData(_):
             return "/Home/getIndexV2"
        case .loadCourseDetail(_):
            return "/Edu/getCourseDetails"
        case .loadOrgDetail(_):
            return "/Edu/getOrgDetails"
        }
  
}
}
