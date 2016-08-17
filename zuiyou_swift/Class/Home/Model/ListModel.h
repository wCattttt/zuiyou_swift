//
//  ListModel.h
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "BaseModel.h"

@class MemberModel;
@class TopicModel;
@class ReviewModel;

@interface ListModel : BaseModel

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

//var id: NSNumber?
//var mid: NSNumber?
//var content: String?
//var reviews: NSNumber?
//var likes: String?
//var up: NSNumber?
//var ct: NSNumber?
//var imgs: NSArray?
//var status: NSNumber?
//var share: NSNumber?
//var type: NSNumber?
//var webpage: NSArray?
//var member:String?  //
//var topic:String?   //
//var god_review:String?   //

@property (nonatomic, strong) NSNumber *newid;
@property (nonatomic, strong) NSNumber *mid;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSNumber *reviews;
@property (nonatomic, strong) NSNumber *likes;
@property (nonatomic, strong) NSNumber *up;
@property (nonatomic, strong) NSNumber *ct;
@property (nonatomic, strong) NSArray *imgs;
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, strong) NSNumber *share;
@property (nonatomic, strong) NSNumber *type;
@property (nonatomic, strong) NSArray *webpage;
@property (nonatomic, retain) MemberModel *member;
@property (nonatomic, retain) TopicModel *topic;
@property (nonatomic, retain) ReviewModel *god_review;

@end
