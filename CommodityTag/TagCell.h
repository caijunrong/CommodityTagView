//
//  TagCell.h
//  CommodityTag
//
//  Created by biyabi on 15/10/23.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TagCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *tagLabel;

+(instancetype)cellWithCollectionView:(UICollectionView *)collectionView andIndexPath:(NSIndexPath *)indexPath;

@end
