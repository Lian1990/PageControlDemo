//
//  BookPageCollectionViewCell.m
//  TestThree
//
//  Created by LIAN on 15/12/23.
//  Copyright (c) 2015年 com.Lian365. All rights reserved.
//

#import "BookPageCollectionViewCell.h"

@implementation BookPageCollectionViewCell
{
    BOOL isRightPage;
}
@synthesize bgView = _bgView;
@synthesize textL = _textL;
@synthesize imaV = _imaV;


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.contentView.backgroundColor = [UIColor redColor];

        _bgView = [[UIView alloc]initWithFrame:self.contentView.bounds];
        _bgView.backgroundColor = [UIColor whiteColor];
        
        _imaV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kUIWidth/2-20, 280)];
        
        _textL = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 40)];
        _textL.center = CGPointMake(_bgView.frame.size.width/2, _bgView.frame.size.height-50);
        _textL.textColor = [UIColor colorWithRed:0.8 green:0.6 blue:0.5 alpha:1.0];
        
        [self.contentView addSubview:_bgView];
        [_bgView addSubview:_imaV];
        [_bgView addSubview:_textL];
        
        self.layer.allowsEdgeAntialiasing = YES;

        
    }
    return self;
}
/**
 *  自定义布局 布局圆角和中心线
 *
 *  @param layer <#layer description#>
 */
-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    
    
    [super applyLayoutAttributes:layoutAttributes];
    //anchorPoint （0，0）（1，1）
    //偶数
    if (layoutAttributes.indexPath.item %2 == 0) {
        isRightPage = YES;
        self.layer.anchorPoint = CGPointMake(0, 0.5);
    }
    else
    {
        isRightPage = NO;
        self.layer.anchorPoint = CGPointMake(1, 0.5);
    }
    //圆角设置
    UIRectCorner corner = isRightPage ? UIRectCornerBottomRight|UIRectCornerTopRight :UIRectCornerTopLeft|UIRectCornerBottomLeft;
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:_bgView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(16, 16)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = _bgView.bounds;
    maskLayer.path = bezier.CGPath;
    _bgView.layer.mask = maskLayer;
    _bgView.clipsToBounds = YES;
    
}
@end
