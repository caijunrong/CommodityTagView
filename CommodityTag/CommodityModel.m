//
//  CommodityModel.m
//  CommodityTag
//
//  Created by caijunrong on 15/10/23.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommodityModel.h"
#import "TagModel.h"

@implementation CommodityModel

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

//- (void)setTagModelArray:(NSArray *)tagModelArray{
//    
//    NSMutableArray *tagMuArray = [[NSMutableArray alloc]init];
//
//    for (NSDictionary *dic in tagModelArray) {
//        TagModel *tagModel = [TagModel modelWithDict:dic];
//        
//        [tagMuArray addObject:tagModel];
//    }
//    
//    _tagModelArray = tagMuArray;
//    
//}

@end
