//
//  ViewController.m
//  collectionViewFlowLayout
//
//  Created by qiuximou on 16/4/30.
//  Copyright © 2016年 qiuximou. All rights reserved.
//

#import "ViewController.h"
#import "XMCollectionViewCell.h"
#import "XMCollectionViewHorizontalLayout.h"


@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ViewController

#pragma mark lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    XMCollectionViewHorizontalLayout * layout = [[XMCollectionViewHorizontalLayout alloc]init];
    layout.totalRow = 4;
    layout.totalColum = 5;
    layout.edgeInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.cellHeight = 40;
    layout.cellWidth = [UIScreen mainScreen].bounds.size.width / 6;
    [self.collectionView setCollectionViewLayout:layout];
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([XMCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:@"XMCollectionViewCell"];
    
    NSLog(@"this is a gest");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark datasource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 200;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XMCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XMCollectionViewCell" forIndexPath:indexPath];
    cell.label.text = [NSString stringWithFormat:@"%ld",indexPath.item];
    return cell;
    
}
#pragma mark delegate

@end
