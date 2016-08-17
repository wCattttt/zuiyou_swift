//
//  MemberModel.m
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "MemberModel.h"

@implementation MemberModel
- (instancetype)initWithDataDic:(NSDictionary *)data{
    self = [super initWithDataDic:data];
    if(self){
        NSNumber *memberid = data[@"id"];
        if(memberid != nil){
            _memberid = memberid;
        }
    }
    return self;
}
@end
