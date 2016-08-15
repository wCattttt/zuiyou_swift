//
//  RequestClient.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/10.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//


import UIKit
import AFNetworking

class RequestClient: AFHTTPSessionManager {
//    class var sharedInstance :RequestClient {
//        struct Static {
//            static var onceToken: dispatch_once_t = 0
//            static var instance:RequestClient? = nil
//            
//            static let onceToken = RequestClient()
//        }
//        
//        dispatch_once(&Static.onceToken, { () -> Void in
//            //string填写相应的baseUrl即可
//            var url:NSURL = NSURL(string: "")!
//            Static.instance = RequestClient(baseURL: url)
//        })
//        //返回本类的一个实例
//        return Static.instance!
//
//    }
    
    static let sharedInstance: RequestClient = {
        let instance = RequestClient()
        // setup code
        return instance
    }()
}
