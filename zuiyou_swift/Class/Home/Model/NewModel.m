//
//  NewModel.m
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "NewModel.h"
#import "ListModel.h"

@implementation NewModel
- (instancetype)initWithDataDic:(NSDictionary *)data{
    self = [super initWithDataDic:data];
    if(self){
        NSArray *list = data[@"data"][@"list"];
        NSMutableArray *modelList = @[].mutableCopy;
        if(list != nil && list.count > 0){
            [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                ListModel *listModel = [[ListModel alloc] initWithDataDic:obj];
                [modelList addObject:listModel];
            }];
            _data = [NSDictionary dictionaryWithObjectsAndKeys:modelList, @"list", nil];
        }
    }
    return self;
    
}
- (void)Hello{}

@end
