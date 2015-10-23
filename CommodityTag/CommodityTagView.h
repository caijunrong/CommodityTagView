//
//  CommodityTagView.h
//  CommodityTag
//
//  Created by biyabi on 15/10/23.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommodityModel;
@interface CommodityTagView : UIView<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSArray *commodityModelArray;

//初始化collectionView
-(void)initCollectionViewWithModel:(NSArray *)commModelArray;

@end
