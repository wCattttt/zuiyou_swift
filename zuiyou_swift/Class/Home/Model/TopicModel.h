//
//  TopicModel.h
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "BaseModel.h"

@interface TopicModel : BaseModel
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

//var id: NSNumber?
//var topic: String?
//var cover: NSNumber?
//var atts_title: String?
//var posts: NSNumber?
//var partners: NSNumber?
//var atts: NSNumber?
//var addition: String?
//var share: NSNumber?
//var ut: NSNumber?

@property (nonatomic, strong) NSNumber *topicid;
@property (nonatomic, copy) NSString *topic;
@property (nonatomic, strong) NSNumber *cover;
@property (nonatomic, copy) NSString *atts_title;
@property (nonatomic, strong) NSNumber *posts;
@property (nonatomic, strong) NSNumber *partners;
@property (nonatomic, strong) NSNumber *atts;
@property (nonatomic, copy) NSString *addition;
@property (nonatomic, strong) NSNumber *share;
@property (nonatomic, strong) NSNumber *ut;

@end
