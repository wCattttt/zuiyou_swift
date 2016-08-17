//
//  NewModel.h
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "BaseModel.h"

@interface NewModel : BaseModel

@property (nonatomic, strong) NSNumber *ret;
@property (nonatomic, retain) NSDictionary *data;

- (void)Hello;

@end
