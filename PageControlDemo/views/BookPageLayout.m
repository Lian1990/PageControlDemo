//
//  BookPageLayout.m
//  TestThree
//
//  Created by LIAN on 15/12/24.
//  Copyright (c) 2015年 com.leying365. All rights reserved.
//

#import "BookPageLayout.h"

@implementation BookPageLayout

static CGFloat pageWidth = 170;
static CGFloat pageHeight = 280;
static CGFloat numberofPages = 0;


/**
 *  布局
 */
-(void)prepareLayout
{
    [super prepareLayout];
    self.collectionView.decelerationRate = UIScrollViewDecelerationRateNormal;
    numberofPages = [self.collectionView numberOfItemsInSection:0];
    self.collectionView.pagingEnabled = YES;//页面的翻动
//    UICollectionViewFlowLayout
}
//布局实时更新
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}
-(CGSize)collectionViewContentSize
{
    //一个视图上显示两页
    CGFloat width = numberofPages /2 -1 ;
    return CGSizeMake(width*self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *layoutattribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    
    CGRect frame;
    frame.origin.x = self.collectionView.bounds.size.width / 2 - pageWidth/2 +self.collectionView.contentOffset.x;
    frame.origin.y = (self.collectionViewContentSize.height - pageHeight) / 2;;
    frame.size.width = pageWidth;
    frame.size.height = pageHeight;
    layoutattribute.frame = frame;

        
    CGFloat page = (indexPath.item - indexPath.item %2)*0.5;//00112233
    CGFloat ratio = -0.5 + page - (self.collectionView.contentOffset.x/self.collectionView.bounds.size.width);//通过偏移量 获取比重
    //限制偏移比重
    if (ratio > 0.5) {
        ratio = 0.5 + 0.1*(ratio - 0.5);
    }else if (ratio < -0.5)
    {
        ratio = -0.5 +0.1*(ratio +0.5);
    }
    if ((ratio >0 && indexPath.item %2 == 1)||(ratio < 0 && indexPath.item %2 == 0)) {
        if (indexPath.row != 1) {
            return nil;
        }
    }
    //计算角度 倾斜角度
    CGFloat newRatio = MIN(MAX(ratio, -1), 1);
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = 1.0/-2000;
    
    CGFloat angle = 0.0f;
    if (indexPath.item %2 == 0) {
        angle = (1 - newRatio)*(-M_PI_2);
    }else if (indexPath.row %2 == 1)
    {
        angle = (1+newRatio)*(M_PI_2);
    }
    angle += (indexPath.row %2)/1000;
    
    transform = CATransform3DRotate(transform, angle, 0, 1, 0);
    
    layoutattribute.transform3D = transform;
    
    if (indexPath.row == 0) {
        layoutattribute.zIndex = NSIntegerMax;
    }
    return layoutattribute;
}
//所有cell的布局数组
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSUInteger i = 0; i < numberofPages; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *att = [self layoutAttributesForItemAtIndexPath:index];
        if (att != nil) {
            [array addObject:att];
        }
    }
    return array;
    

}

@end
