//
//  ImgModel.h
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

#import "BaseModel.h"

@interface ImgModel : BaseModel
/*
 "id": 18528398,
 "w": 690,
 "h": 6210,
 "fmt": "jpeg"
 */

//var id: NSNumber?
//var w: NSNumber?
//var h: NSNumber?
//var fmt: String?

@property (nonatomic, strong) NSNumber *imgid;
@property (nonatomic, strong) NSNumber *w;
@property (nonatomic, strong) NSNumber *h;
@property (nonatomic, copy) NSString *fmt;

@end
