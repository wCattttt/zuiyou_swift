//
//  ImgModel.m
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "ImgModel.h"

@implementation ImgModel
- (instancetype)initWithDataDic:(NSDictionary *)data{
    self = [super initWithDataDic:data];
    if(self){
        NSNumber *imgid = data[@"id"];
        if(imgid != nil){
            _imgid = imgid;
        }
    }
    return self;
}
@end
