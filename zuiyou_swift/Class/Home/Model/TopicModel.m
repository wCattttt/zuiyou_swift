//
//  TopicModel.m
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "TopicModel.h"

@implementation TopicModel
- (instancetype)initWithDataDic:(NSDictionary *)data{
    self = [super initWithDataDic:data];
    if(self){
        NSNumber *topicid = data[@"id"];
        if(topicid != nil){
            _topicid = topicid;
        }
    }
    return self;
}
@end
