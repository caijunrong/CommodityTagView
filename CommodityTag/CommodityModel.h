//
//  CommodityModel.h
//  CommodityTag
//
//  Created by caijunrong on 15/10/23.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TagModel;

@interface CommodityModel : NSObject

@property (nonatomic, assign) NSInteger commodityID;

@property (nonatomic, copy) NSString *commodityName;

@property (nonatomic, strong) NSArray *tagModelArray;

-(id)initWithDict:(NSDictionary *)dictionary;

+(id)modelWithDict:(NSDictionary *)dictionary;

@end
