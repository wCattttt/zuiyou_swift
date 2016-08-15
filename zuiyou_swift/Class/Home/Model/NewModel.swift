//
//  NewModel.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/12.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit
//import Mapp

class NewModel: SWBaseModel {
    var ret: NSNumber?
    var data: NSDictionary!
    
    override func initWithDataDic(data: NSDictionary) -> AnyObject{
        if super.initWithDataDic(data: data).count > 0 {
            let list = NSArray(array: (data["data"]?["list"])! as! [AnyObject])
            
            let modelLists = NSArray()
            
            if list.count > 0 {
                for var obj in list {
                    let listModel = ListModel.initWithDataDic(obj as! ListModel) as! AnyObject
                    modelLists.adding(listModel)
                }
                data.setValue(modelLists, forKey: "list")
            }
            
        }
        return 1
    }
}
