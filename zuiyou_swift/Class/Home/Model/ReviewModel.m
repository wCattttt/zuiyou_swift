//
//  RevieModel.m
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "ReviewModel.h"

@implementation ReviewModel
- (instancetype)initWithDataDic:(NSDictionary *)data{
    self = [super initWithDataDic:data];
    if(self){
        NSNumber *reviewid = data[@"id"];
        if(reviewid != nil){
            _reviewid = reviewid;
        }
    }
    return self;
}
@end
