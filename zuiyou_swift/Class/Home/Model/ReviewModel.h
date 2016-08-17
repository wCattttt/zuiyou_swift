//
//  RevieModel.h
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "BaseModel.h"

@interface ReviewModel : BaseModel
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


//var id: NSNumber?
//var pid: NSNumber?
//var mid: NSNumber?
//var review: String?
//var ct: NSNumber?
//var likes: NSNumber?
//var up: NSNumber?
//var down: NSNumber?
//var isgod: Boolean?
//var mname: String?
//var avatar: NSNumber?
//var gender: NSNumber?

@property (nonatomic, strong) NSNumber *reviewid;
@property (nonatomic, strong) NSNumber *pid;
@property (nonatomic, strong) NSNumber *mid;
@property (nonatomic, copy) NSString *review;
@property (nonatomic, strong) NSNumber *ct;
@property (nonatomic, strong) NSNumber *likes;
@property (nonatomic, strong) NSNumber *up;
@property (nonatomic, strong) NSNumber *down;
@property (nonatomic, strong) NSNumber *isgod;
@property (nonatomic, copy) NSString *mname;
@property (nonatomic, strong) NSNumber *avatar;
@property (nonatomic, strong) NSNumber *gender;

@end
