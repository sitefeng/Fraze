//
//  ViewController.m
//  Fraze
//
//  Created by Si Te Feng on 12/21/14.
//  Copyright (c) 2014 Si Te Feng. All rights reserved.
//

#import "ViewController.h"
#import "FRGroupWallDashlet.h"
#import "FRMainWallDashlet.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView* collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, 320, 100) collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor blueColor];
    [collectionView registerClass:[FRGroupWallDashlet class] forCellWithReuseIdentifier:@"FRGroupWallDashlet"];
    [self.view addSubview:collectionView];
    
    
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
    UICollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FRGroupWallDashlet" forIndexPath:indexPath];
    
    
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
