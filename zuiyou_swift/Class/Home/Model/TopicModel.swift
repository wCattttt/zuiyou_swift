//
//  TopicModel.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/12.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class TopicModel: SWBaseModel {
    /*
    "id": 101698,
    "topic": "#十二星座各种宝#",
    "cover": 12783853,
    "atts_title": "十二星黄金战士",
    "posts": 3922,
    "partners": 71175,
    "atts": 71175,
    "addition": "71175个十二星黄金战士",
    "share": -1,
    "ut": 1470973346
     */
    
    var id: NSNumber?
    var topic: String?
    var cover: NSNumber?
    var atts_title: String?
    var posts: NSNumber?
    var partners: NSNumber?
    var atts: NSNumber?
    var addition: String?
    var share: NSNumber?
    var ut: NSNumber?
}
