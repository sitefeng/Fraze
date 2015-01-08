//
//  ViewController.m
//  Fraze
//
//  Created by Si Te Feng on 12/21/14.
//  Copyright (c) 2014 Si Te Feng. All rights reserved.
//

#import "ViewController.h"
#import "FRMainWallDashlet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.mainCollectionView setDelegate:self];
    [self.mainCollectionView setDataSource:self];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}


- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FRMainWallDashlet* cell = (FRMainWallDashlet*)[collectionView dequeueReusableCellWithReuseIdentifier:@"FRGroupWallDashlet" forIndexPath:indexPath];
    [cell setup];
    cell.title.text = @"My Boys";
    cell.subtitle.text = @"10 hours ago...";
    
    cell.mainImageView.image = [UIImage imageNamed:@"img1"];
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
