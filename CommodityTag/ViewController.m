//
//  ViewController.m
//  CommodityTag
//
//  Created by biyabi on 15/10/23.
//  Copyright © 2015年 biyabi. All rights reserved.
//

#import "ViewController.h"
#import "CommodityModel.h"
#import "TagModel.h"
#import "CommodityTagView.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *commModelArray;

@property (nonatomic, strong) UIView *backView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor purpleColor]];
    
    CommodityTagView *commView = [[CommodityTagView alloc]initWithFrame:CGRectMake(0, 150, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    //先在控制器中产生数据
    [self initCommModelArray];
    
    //初始化view
    [commView initCollectionViewWithModel:self.commModelArray];

    [self.view addSubview:self.backView];
    
    //加入view中
    [self.view addSubview:commView];
    
}


- (UIView *)backView{

    if (!_backView ) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
        
        [_backView setBackgroundColor:[UIColor blackColor]];

        [_backView setAlpha:0.6];
        
    }
    
    return _backView;
}

/*
 *  批量产生数据
 */
- (void )initCommModelArray{
    if (_commModelArray == nil) {
        
        //第一个model
        TagModel *tag1 = [[TagModel alloc]init];
        tag1.tagID = 1;
        tag1.tagName = @"土豪金（香槟色）";
        tag1.modelSelected = NO;
        
        TagModel *tag2 = [[TagModel alloc]init];
        tag2.tagID = 2;
        tag2.tagName = @"深空灰";
        tag2.modelSelected = NO;
        
        TagModel *tag3 = [[TagModel alloc]init];
        tag3.tagID = 3;
        tag3.tagName = @"银白色";
        tag3.modelSelected = NO;
        
        TagModel *tag4 = [[TagModel alloc]init];
        tag4.tagID = 4;
        tag4.tagName = @"脑残粉（粉色）";
        tag4.modelSelected = NO;
        
        CommodityModel *commModel1 = [[CommodityModel alloc]init];
        commModel1.commodityID = 1;
        commModel1.commodityName = @"机身颜色";
        NSArray *arr1 = [[NSArray alloc]initWithObjects:tag1, tag2, tag3, tag4, nil];

        commModel1.tagModelArray = arr1;
        
        //第二个model
        TagModel *tag11 = [[TagModel alloc]init];
        tag11.tagID = 11;
        tag11.tagName = @"大陆行货";
        tag11.modelSelected = NO;
        
        TagModel *tag12 = [[TagModel alloc]init];
        tag12.tagID = 12;
        tag12.tagName = @"港版";
        tag12.modelSelected = NO;
        
        TagModel *tag13 = [[TagModel alloc]init];
        tag13.tagID = 13;
        tag13.tagName = @"美版";
        tag13.modelSelected = NO;
        
        TagModel *tag14 = [[TagModel alloc]init];
        tag14.tagID = 14;
        tag14.tagName = @"亚太（日版／韩版／台版）";
        tag14.modelSelected = NO;
        
        CommodityModel *commModel2 = [[CommodityModel alloc]init];
        commModel2.commodityID = 2;
        commModel2.commodityName = @"版本类型";
        commModel2.tagModelArray = [NSArray arrayWithObjects:tag11, tag12, tag13, tag14, nil];
        
        //第三个model
        TagModel *tag21 = [[TagModel alloc]init];
        tag21.tagID = 21;
        tag21.tagName = @"16G";
        tag21.modelSelected = NO;
        
        TagModel *tag22 = [[TagModel alloc]init];
        tag22.tagID = 22;
        tag22.tagName = @"64G";
        tag22.modelSelected = NO;
        
        TagModel *tag23 = [[TagModel alloc]init];
        tag23.tagID = 23;
        tag23.tagName = @"128G";
        tag23.modelSelected = NO;
        
        CommodityModel *commModel3 = [[CommodityModel alloc]init];
        commModel3.commodityID = 3;
        commModel3.commodityName = @"机身内存";
        commModel3.tagModelArray = [NSArray arrayWithObjects:tag21, tag22, tag23, nil];
        
        _commModelArray = [[NSMutableArray alloc]init];
        
        [_commModelArray addObject:commModel1];
        [_commModelArray addObject:commModel2];
        [_commModelArray addObject:commModel3];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
