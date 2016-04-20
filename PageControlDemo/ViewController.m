//
//  ViewController.m
//  PageControlDemo
//
//  Created by LIAN on 16/4/20.
//  Copyright © 2016年 com.Alice. All rights reserved.
//


#import "ViewController.h"

#import "BookPageCollectionViewCell.h"
#import "BookPageLayout.h"

@interface ViewController ()

@end


@implementation ViewController

@synthesize bookView = _bookView;
@synthesize imaArr = _imaArr;
@synthesize nameArr = _nameArr;


static NSString *identifierCell = @"identify";


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self buildStage];
    
}
-(void)buildStage
{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    BookPageLayout *layout = [[BookPageLayout alloc]init];
    _bookView = [[UICollectionView alloc]initWithFrame:CGRectMake(20, 110, kUIWidth -40, 500) collectionViewLayout:layout];
    _bookView.delegate = self;
    _bookView.dataSource = self;
    
    _bookView.backgroundColor = [UIColor grayColor];
    _bookView.showsHorizontalScrollIndicator = NO;//横轴
    //    _bookView.showsVerticalScrollIndicator = NO;//数轴
    _bookView.alwaysBounceHorizontal = YES;
    
    [_bookView registerClass:[BookPageCollectionViewCell class] forCellWithReuseIdentifier:identifierCell];
    //提前注册过   下面复用cell的时候就不用判断if（cell == nil）
    
    [self.view addSubview:_bookView];
    
    _nameArr = [NSMutableArray arrayWithObjects:@"",@"第一页",@"第二页",@"第三页",@"第四页",@"第五页",@"第六页",@"第七页",@"第八页",@"第九页",@"第十页",@"", nil];
    //    _imaArr =(NSMutableArray *) @[@"1.JPG",@"2.JPG",@"3.JPG",@"4.JPG",@"5.JPG",@"6.JPG",@"7.JPG",@"8.JPG",@"9.JPG",@"10.JPG"];
    _imaArr = [NSMutableArray arrayWithObjects:@"",@"1.JPG",@"2.JPG",@"3.JPG",@"4.JPG",@"5.JPG",@"6.JPG",@"7.JPG",@"8.JPG",@"9.JPG",@"10.JPG",@"", nil];
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 12;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookPageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierCell forIndexPath:indexPath];
    cell.imaV.image =[UIImage imageNamed:[_imaArr objectAtIndex:indexPath.row]];
    cell.textL.text = [NSString stringWithFormat:@"%@",[_nameArr objectAtIndex:indexPath.row]];
    //    cell.imaV.image =[UIImage imageNamed:_imaArr[indexPath.row]];
    //    cell.textL.text = [NSString stringWithFormat:@"%@",_nameArr[indexPath.row]];
    return cell;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 15, 10);//分别为上、左、下、右
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
