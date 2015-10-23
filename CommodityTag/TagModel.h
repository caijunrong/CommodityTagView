//
//  TagModel.h
//  CommodityTag
//
//  Created by caijunrong on 15/10/23.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TagModel : NSObject

@property (nonatomic, assign) NSInteger tagID;

@property (nonatomic, copy) NSString *tagName;

@property (nonatomic, assign) BOOL modelSelected;

@property (nonatomic, assign) float tagWidth;

-(id)initWithDict:(NSDictionary *)dictionary;

+(id)modelWithDict:(NSDictionary *)dictionary;

@end
