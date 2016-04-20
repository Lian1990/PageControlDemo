//
//  ViewController.h
//  PageControlDemo
//
//  Created by LIAN on 16/4/20.
//  Copyright © 2016年 com.Alice. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>


@property (strong,nonatomic) UICollectionView *bookView;
@property (strong,nonatomic) NSMutableArray *imaArr;
@property (strong,nonatomic) NSMutableArray *nameArr;



@end

