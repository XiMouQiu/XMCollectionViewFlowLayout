//
//  XMCollectionViewHorizontalLayout.m
//  collectionViewFlowLayout
//
//  Created by qiuximou on 16/4/30.
//  Copyright © 2016年 qiuximou. All rights reserved.
//

#import "XMCollectionViewHorizontalLayout.h"

@interface XMCollectionViewHorizontalLayout ()

@property (strong, nonatomic) NSMutableArray * attributes;

@end

@implementation XMCollectionViewHorizontalLayout

//collection view的准备工作
- (void)prepareLayout
{
    [super prepareLayout];
    
}

//确定collection view的content size
- (CGSize)collectionViewContentSize
{
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.frame);
    CGFloat width = 0;
    NSInteger sectionNumber = [self.collectionView numberOfSections];
    if (sectionNumber * self.totalRow * self.totalRow == 0) {
        return CGSizeZero;
    }
    
    for (int i = 0; i < sectionNumber; i++) {
        NSInteger fullPage = [self.collectionView numberOfItemsInSection:i]/(self.totalRow * self.totalColum);
        width += collectionViewWidth * fullPage;
        NSInteger notFullPage = [self.collectionView numberOfItemsInSection:i] % (self.totalColum * self.totalRow);
        if (notFullPage > 0) {
            width += collectionViewWidth;
        }
    }
    
    return CGSizeMake(width, self.edgeInset.top + self.edgeInset.bottom + self.totalRow * self.cellHeight + self.rowMargin * (self.totalRow - 1));
    
}

//返回可视区域cell 布局
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    [self.attributes removeAllObjects];
    NSInteger  sections = [self.collectionView numberOfSections];
    for ( int i = 0 ; i < sections; i ++) {
        NSInteger items = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < items; j ++) {
            NSIndexPath * path = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes * attribute = [self layoutAttributesForItemAtIndexPath:path];
            [self.attributes addObject:attribute];
        }
    }
    return self.attributes;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat sectionWidth = 0;
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.frame);
    
    for (int i = 1 ; i <= indexPath.section; i ++) {
        sectionWidth  += collectionViewWidth * ([self.collectionView numberOfItemsInSection:i- 1] / (self.totalColum *self.totalRow) + 1);
    }
    CGFloat baseWidth =  sectionWidth + indexPath.item / (self.totalColum *self.totalRow) * collectionViewWidth;
    CGFloat marginX = (collectionViewWidth -  self.edgeInset.left - self.edgeInset.right - self.cellWidth * self.totalColum ) / (self.totalColum - 1);
    
    CGFloat X = baseWidth + self.edgeInset.left + (indexPath.item % self.totalColum)* (self.cellWidth +marginX);
    CGFloat Y = self.edgeInset.top + ((indexPath.item %(self.totalColum *self.totalRow))/ self.totalColum) * (self.cellHeight + self.rowMargin);
    UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attr.frame = CGRectMake(X, Y, self.cellWidth, self.cellHeight);
    return attr;

}

#pragma mark getter & setter

- (NSMutableArray *) attributes
{
    if (!_attributes) {
        self.attributes = [NSMutableArray new];
    }
    return _attributes;
}

@end
