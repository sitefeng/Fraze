//
//  ViewController.m
//  Fraze
//
//  Created by Si Te Feng on 12/21/14.
//  Copyright (c) 2014 Si Te Feng. All rights reserved.
//

#import "FRMainWallViewController.h"
#import "FRMainWallDashlet.h"
#import "JPStyle.h"
#import "FRMainNavigationController.h"

const float kDashletWidthFactor = 0.95;


@interface FRMainWallViewController ()

@property (weak, nonatomic) IBOutlet UIButton *plusButton;

@end


@implementation FRMainWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //Setup Navigation Bar
    [self.navigationController.navigationBar setBarTintColor:[JPStyle interfaceTintColor]];
    
    UIButton* titleView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    UIButton* titleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [titleButton setImage:[UIImage imageNamed:@"whiteLogo"] forState:UIControlStateNormal];
    titleButton.contentMode = UIViewContentModeScaleAspectFit;
    [titleButton addTarget:self.navigationController action:@selector(titlePressed) forControlEvents:UIControlEventTouchUpInside];
    [titleView addSubview:titleButton];
    self.navigationItem.titleView = titleView;
    
    UIBarButtonItem* flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    UIButton* leftBarButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    [leftBarButton setImage:[UIImage imageNamed:@"notifIcon2"] forState:UIControlStateNormal];
    [leftBarButton addTarget:self.navigationController action:@selector(leftBarButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBarButton];
    self.navigationItem.leftBarButtonItems = @[leftItem, flex];

    UIButton* rightBarButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    [rightBarButton setImage:[UIImage imageNamed:@"searchIcon1"] forState:UIControlStateNormal];
    [rightBarButton addTarget:self.navigationController action:@selector(rightBarButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBarButton];

    [self.plusButton setImage:[UIImage imageNamed:@"plusButton"] forState:UIControlStateNormal];
    
    [self.mainCollectionView setDelegate:self];
    [self.mainCollectionView setDataSource:self];
    self.mainCollectionView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    self.mainCollectionView.backgroundColor = [JPStyle interfaceTintColor];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    
    
}






- (IBAction)upVotePressed:(id)sender
{
    
    
    
}

- (IBAction)plusButtonPressed:(id)sender
{
    FRMainNavigationController* navController = (FRMainNavigationController*)[self navigationController];
    [navController newPostButtonPressed];
}



#pragma mark - Collection View Delegate Flow Layout

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
    
    cell.avatarImageView.image = [UIImage imageNamed:@"profile1"];
    cell.mainImageView.image = [UIImage imageNamed:@"img1"];
    
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize newSize = CGSizeMake(kDashletWidthFactor*[JPStyle deviceWidth], 350);
    return newSize;
}






#pragma mark - Application Lifecycle



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

