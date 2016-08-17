//
//  ListModel.m
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "ListModel.h"
#import "MemberModel.h"
#import "TopicModel.h"
#import "ReviewModel.h"
#import "ImgModel.h"

@implementation ListModel
- (instancetype)initWithDataDic:(NSDictionary *)data{
    self = [super initWithDataDic:data];
    if(self){
        NSNumber *newid = data[@"id"];
        if(newid != nil){
            _newid = newid;
        }
        
        NSArray *imgs = data[@"imgs"];
        NSMutableArray *imgList = @[].mutableCopy;
        if(imgs != nil && imgs.count > 0){
            [imgs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                ImgModel *imgModel = [[ImgModel alloc] initWithDataDic:obj];
                [imgList addObject:imgModel];
            }];
            _imgs = imgList;
        }
        
        NSDictionary *member = data[@"member"];
        if(member != nil){
            MemberModel *memberModel = [[MemberModel alloc] initWithDataDic:member];
            _member = memberModel;
        }
        
        NSDictionary *topic = data[@"topic"];
        if(topic != nil){
            TopicModel *topicModel = [[TopicModel alloc] initWithDataDic:topic];
            _topic = topicModel;
        }
        
        NSDictionary *review = data[@"god_review"];
        if(review != nil){
            ReviewModel *revieModel = [[ReviewModel alloc] initWithDataDic:review];
            _god_review = revieModel;
        }
        
        
    }
    return self;
    
}
@end
