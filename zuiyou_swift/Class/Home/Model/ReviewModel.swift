//
//  ReviewModel.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/12.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class ReviewModel: SWBaseModel {
    /*
    "id": 27235431,
    "pid": 5391244,
    "mid": 2035529,
    "review": "本射手不想说话，并射了你一手",
    "ct": 1470310129,
    "likes": 214,
    "up": 218,
    "down": 4,
    "isgod": 1,
    "mname": "断桃花的BE酱",
    "avatar": 16670280,
    "gender": 2
     */
    
    
    var id: NSNumber?
    var pid: NSNumber?
    var mid: NSNumber?
    var review: String?
    var ct: NSNumber?
    var likes: NSNumber?
    var up: NSNumber?
    var down: NSNumber?
    var isgod: Boolean?
    var mname: String?
    var avatar: NSNumber?
    var gender: NSNumber?
}
