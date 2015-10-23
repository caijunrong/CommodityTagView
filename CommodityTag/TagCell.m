//
//  TagCell.m
//  CommodityTag
//
//  Created by biyabi on 15/10/23.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "TagCell.h"

@implementation TagCell

- (void)awakeFromNib {
    // Initialization code
    
    [self.layer setCornerRadius:7.0f];
    
    [self.layer setMasksToBounds:YES];
    
    NSLog(@"--");
}

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *TagCellCellID = @"TagCell";
    
    TagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TagCellCellID forIndexPath:indexPath];

    //一般都不会为空了，就算缓存池没有，也会直接由xib创建，所以拿到的cell不为空
    if (!cell) {
        cell = [[TagCell alloc]init];
    }
    return cell;
}

@end
