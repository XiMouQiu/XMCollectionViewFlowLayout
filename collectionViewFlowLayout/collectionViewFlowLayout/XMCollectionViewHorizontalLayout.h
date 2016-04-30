//
//  XMCollectionViewHorizontalLayout.h
//  collectionViewFlowLayout
//
//  Created by qiuximou on 16/4/30.
//  Copyright © 2016年 qiuximou. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  有些个别需求要使collectionView的横向排布，但原生的FlowLayout只能纵向排列不能横向填充，即：
 -----------------
 0  2  4  6
 
 1  3  5  7
 -----------------
 想达到的要求是横向填充即
 ----------------
 0  1  2  3
 
 4  5  6  7
 -----------------
 不用写Sction有多少，把rows告诉即可
 */

@interface XMCollectionViewHorizontalLayout : UICollectionViewLayout

//总列数
@property (assign, nonatomic) NSInteger totalColum;
//总行数
@property (assign, nonatomic) NSInteger totalRow;

@property (assign, nonatomic) UIEdgeInsets edgeInset;
//每个cell宽度
@property (assign, nonatomic) float cellWidth;
//cell 高度
@property (assign, nonatomic) float cellHeight;
//每行间距
@property (assign, nonatomic) NSInteger rowMargin;

@end
