//
//  RequestData.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/10.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit
import AFNetworking

typealias Succeed = (URLSessionDataTask?,AnyObject?)->Void
typealias Failure = (URLSessionDataTask?,Data?)->Void

class RequestData: NSObject {
//    func requestGet(url: String, params: NSDictionary, reqComplete: (data: NSData)-> () ) {
//        
//        let afManager = AFURLSessionManager
//        
////        reqComplete(data: NSData)
//    }
    
    //普通get网络请求
    class func GET(url:String!,parameter:AnyObject?,succeed:Succeed,failed:Failure) {
        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        let requestClient = RequestClient.sharedInstance
        
        requestClient.requestSerializer = AFHTTPRequestSerializer()
//        requestClient.requestSerializer.setValue("text/plain", forHTTPHeaderField: "Accept")
        requestClient.requestSerializer.setValue("text/html; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        RequestClient.sharedInstance.get(url, parameters: parameter, progress: nil, success: { (task: URLSessionDataTask?, requestObject: AnyObject?) in
                mysucceed(task, requestObject)
        }) { (task: URLSessionDataTask?, error: NSError?) in
            let data: Data = (error?.userInfo["com.alamofire.serialization.response.error.data"])! as! Data
            let text: String = String(data: data, encoding: String.Encoding.utf8)!
            if(!text.isEmpty){
                myfailure(task, data)
            }
            
        }
    }
    
    //Post请求
    class func POST(url:String!,parameter:AnyObject?,succeed:Succeed,failed:Failure) {
        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        let requestClient = RequestClient.sharedInstance
        
        requestClient.requestSerializer = AFHTTPRequestSerializer()
        //        requestClient.requestSerializer.setValue("text/plain", forHTTPHeaderField: "Accept")
        requestClient.requestSerializer.setValue("text/html; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        requestClient.post(url, parameters: parameter, progress: nil, success: { (task: URLSessionDataTask, responseObject: AnyObject?) in
            mysucceed(task, responseObject)
        }) { (task: URLSessionDataTask?, error: NSError) in
            let data: Data = (error.userInfo["com.alamofire.serialization.response.error.data"])! as! Data
            myfailure(task, data)
        }
    }
    
    class func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
}
