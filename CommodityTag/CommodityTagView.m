//
//  CommodityTagView.m
//  CommodityTag
//
//  Created by caijunrong on 15/10/23.
//  Copyright © 2015年 caijunrong. All rights reserved.
//

#import "CommodityTagView.h"
#import "NSString+Extension.h"
#import "CommodityModel.h"
#import "TagModel.h"
#import "TagCell.h"
#import "CollectionHeadView.h"
#import "UICollectionViewLeftAlignedLayout.h"

#define fontSize 12
#define HorizontalMargin 14
#define margin 8
#define cellHeight 28

#define RedColor [UIColor colorWithRed:254.0/255.0 green:91.0/255.0 blue:97.0/255.0 alpha:1.0]

@implementation CommodityTagView

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

//确定view的大小
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (void)initCommodityModelArray:(NSArray *)commArray{
    for (CommodityModel *commModel in commArray) {
        [self initTagWidth:commModel];
    }
}

- (void)initTagWidth:(CommodityModel *)commModel{
    //
    CGSize maxSize = CGSizeMake((self.frame.size.width - HorizontalMargin*2 - margin*2), MAXFLOAT);
    for (TagModel *tagmodel in commModel.tagModelArray) {
        CGSize realSize = [[NSString alloc]sizeWithText:tagmodel.tagName font:[UIFont systemFontOfSize:fontSize] maxSize:maxSize];
        
//        if (realSize.width > maxSize.width) {
//            tagmodel.tagWidth = maxSize.width;
//        }else{
        tagmodel.tagWidth = realSize.width;
//        }
        
    }

}

//初始化collectionView
-(void)initCollectionViewWithModel:(NSArray *)commModelArray{
    
    self.commodityModelArray = commModelArray;
    
    //先把宽度算好
    [self initCommodityModelArray:commModelArray];
    
    
    UICollectionViewLeftAlignedLayout *flowLayout= [[UICollectionViewLeftAlignedLayout alloc]init];
    //修改
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = HorizontalMargin;

    flowLayout.sectionInset = UIEdgeInsetsMake(HorizontalMargin, HorizontalMargin, HorizontalMargin, HorizontalMargin);
    
    UICollectionView *myCollectionView;
    
    myCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:flowLayout];
    
    myCollectionView.delegate = self;
    myCollectionView.dataSource = self;
    myCollectionView.showsVerticalScrollIndicator = NO;
    myCollectionView.backgroundColor = [UIColor whiteColor];

    [myCollectionView registerNib:[UINib nibWithNibName:@"TagCell" bundle:nil] forCellWithReuseIdentifier:@"TagCell"];

    [myCollectionView registerNib:[UINib nibWithNibName:@"CollectionHeadView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"CollectionHeadView"];
    
    [self addSubview:myCollectionView];
    self.collectionView = myCollectionView;
    
}

#pragma mark -- CollectionView delegate & dataSource

//重写--> header
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize headsize;
    headsize = CGSizeMake(self.frame.size.width, 30);
    return headsize;
}


//重写--> header+footer
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //头
        NSLog(@"--");
        
        CollectionHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CollectionHeadView" forIndexPath:indexPath];
        
        if (!headView) {
            headView = [[CollectionHeadView alloc]init];
        }
        
        
        CommodityModel *commModel = self.commodityModelArray[indexPath.section];

        [headView.titleLabel setText:commModel.commodityName];
        
        
        return headView;
        
    }
    
    
    return nil;
}



//cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CommodityModel *commModel = self.commodityModelArray[indexPath.section];
    
    TagModel *tagmodel = commModel.tagModelArray[indexPath.row];
    
//    NSLog(@"section:%ld,row:%ld",indexPath.section,indexPath.row);
//    NSLog(@"tagmodel.tagWidth:%f",tagmodel.tagWidth);
    return CGSizeMake(tagmodel.tagWidth + margin*2,cellHeight);
}

//组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//    NSLog(@"%ld",self.commodityModelArray.count);
    return self.commodityModelArray.count;
}

//列
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    CommodityModel *commModel = self.commodityModelArray[section];
    return commModel.tagModelArray.count;
}

//cell样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TagCell *cell = [TagCell cellWithCollectionView:collectionView andIndexPath:indexPath];
    
    CommodityModel *commModel = self.commodityModelArray[indexPath.section];
    
    TagModel *tagmodel = commModel.tagModelArray[indexPath.row];
    
    cell.tagLabel.text = tagmodel.tagName;
    
    if (tagmodel.modelSelected) {
        [cell setBackgroundColor:RedColor];
        [cell.tagLabel setTextColor:[UIColor whiteColor]];
    }else{
        [cell setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
        [cell.tagLabel setTextColor:[UIColor darkGrayColor]];
    }
    
    
    CGColorRef cgcolor = [UIColor groupTableViewBackgroundColor].CGColor;
    
    [cell.layer setBorderWidth:1.0f];
    
    [cell.layer setBorderColor:cgcolor];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CommodityModel *commModel = self.commodityModelArray[indexPath.section];
    
    
    for (TagModel *tModel in commModel.tagModelArray) {
        tModel.modelSelected = NO;
    }
    
    TagModel *tagmodel = commModel.tagModelArray[indexPath.row];
    
    tagmodel.modelSelected = YES;
    
    [collectionView reloadData];
    
    //然后做选中的实现
    
    
    
}



@end
