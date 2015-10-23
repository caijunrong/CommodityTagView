//
//  TagModel.m
//  CommodityTag
//
//  Created by caijunrong on 15/10/23.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "TagModel.h"

@implementation TagModel

-(id)initWithDict:(NSDictionary *)dictionary{
    if (self = [super init]) {
        
        //批量转
        [self setValuesForKeysWithDictionary:dictionary];
        
    }
    return self;
}

+(id)modelWithDict:(NSDictionary *)dictionary{
    return [[self alloc]initWithDict:dictionary];
}

@end
