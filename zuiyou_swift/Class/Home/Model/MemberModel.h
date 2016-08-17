//
//  MemberModel.h
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "BaseModel.h"

@interface MemberModel : BaseModel

/*
 "id": 358441,
 "isreg": 1,
 "name": "故伎重演",
 "gender": 2,
 "avatar": 543478,
 "sign": "岁月长，衣裳薄。",
 "is_assessor": 0
 */

//var id: NSNumber?
//var isreg: NSNumber?
//var name: String?
//var gender: NSNumber?
//var avatar: NSNumber?
//var sign: String?
//var is_assessor: NSNumber?

@property (nonatomic, strong) NSNumber *memberid;
@property (nonatomic, strong) NSNumber *isreg;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSNumber *gender;
@property (nonatomic, strong) NSNumber *avatar;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, strong) NSNumber *is_assessor;

@end
