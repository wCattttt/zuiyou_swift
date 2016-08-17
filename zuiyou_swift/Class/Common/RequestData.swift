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
typealias Failure = (URLSessionDataTask?,NSError?)->Void

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
                myfailure(task, error)
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
            myfailure(task, error)
        }
    }
    
    // 带请求体body 的请求 使用NSURLSession封装
    class func postBody(urlString: String, parameter: NSDictionary?, succeed:Succeed,failed:Failure) {
        let request = NSMutableURLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        
        var dataStr = String()
        var count = 1
        if parameter != nil{
            for key in (parameter?.allKeys)! {
                let param = parameter?[key as! String] as! String    // "\(key)" + "\(parameter["\(key)"])"
                let parStr: String
                if count == parameter?.allKeys.count {
                    parStr =  "\"\(key)\"" + ":" + "\"\(param)\""
                }else {
                    parStr =  "\"\(key)\"" + ":" + "\"\(param)\","
                }
                dataStr = dataStr.appending(parStr)
                count += 1
            }
            dataStr = "{" + dataStr + "}"
            request.httpBody = dataStr.data(using: String.Encoding.utf8)
        }
        
        let mysucceed:Succeed = succeed
        let myfailure:Failure = failed
        
        let urlSession = URLSession.shared
        let task: URLSessionDataTask = urlSession.dataTask(with: request as URLRequest) { (data, response, error) in
            if error == nil {
                mysucceed(nil, data)
            } else {
                myfailure(nil, error)
            }
        }
        
        task.resume()
        
//        let dataTask: URLSessionDataTask = urlSession.dataTask(with: request) { (data: Data?, response: URLResponse?, error: NSError?) in
//            let dataStr = String(data)
//        }
//        
//        dataTask.resume
        
        
        /*
         NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://tbapi.ixiaochuan.cn/index/recommend?sign=23ff067443feeca74d5fc7e259ab8697"]];
         [request setHTTPMethod:@"POST"];
         
         NSDictionary *params = @{
         @"h_did":@"598ff586c219a681793fb965c4775fa05eaedea2",
         @"token":@"57ad4b49277f28160b6cabfa"
         };
         //
         NSString *body = @"{\"h_did\":\"598ff586c219a681793fb965c4775fa05eaedea2\",\"token\":\"57ad4b49277f28160b6cabfa\"}";
         //    NSData *data = [self returnDataWithDictionary:params];
         NSData *data = [body dataUsingEncoding:NSUTF8StringEncoding];
         //
         [request setHTTPBody:data];
         
         NSURLSession *session = [NSURLSession sharedSession];
         NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
         NSLog(@"====%@", response);
         NSString *datastr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
         NSLog(@"%@", datastr);
         }];
         
         [dataTask resume];
         */
        
    }
    
    
    class func convertStringToDictionary(text: String?) -> [String:AnyObject]? {
//        let index = text.index(text.startIndex, offsetBy: 8)
//        let begStr = text.substring(to: index)
//        if begStr == "Optional" {
//            
//        }
        if text != nil {
            if let data = text?.data(using: String.Encoding.utf8) {
                do {
                    return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        return nil
    }
    
}
