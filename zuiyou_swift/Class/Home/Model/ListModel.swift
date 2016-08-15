//
//  ListModel.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/12.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class ListModel: SWBaseModel {
    /*
    "id": 5391244,
    "mid": 358441,
    "content": "可以，这很十二星座（上）",
    "reviews": 768,
    "likes": 1524,
    "up": 1524,
    "ct": 1470237182,
    "imgs": [],
    "status": 2,
    "share": 717,
    "type": 0,
    "webpage": [ ],
    "member": {},
    "topic": {},
    "god_review": {}
     */
    
    var id: NSNumber?
    var mid: NSNumber?
    var content: String?
    var reviews: NSNumber?
    var likes: String?
    var up: NSNumber?
    var ct: NSNumber?
    var imgs: NSArray?
    var status: NSNumber?
    var share: NSNumber?
    var type: NSNumber?
    var webpage: NSArray?
    var member:String?  //
    var topic:String?   //
    var god_review:String?   //
}
