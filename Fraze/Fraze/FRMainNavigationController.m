//
//  FRMainNavigationController.m
//  Fraze
//
//  Created by Si Te Feng on 1/15/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRMainNavigationController.h"
#import "FRNotifRequestCell.h"
#import "FRNotifViewController.h"
#import "FRProfileViewController.h"
#import "FRMessagesViewController.h"
#import "FRNewPostViewController.h"


@interface FRMainNavigationController ()

@property (nonatomic, strong) FRNewPostViewController* postController;
@property (nonatomic, strong) FRNotifViewController* notifController;
@property (nonatomic, strong) FRProfileViewController* profileController;
@property (nonatomic, strong) FRMessagesViewController* messagesController;


@end

@implementation FRMainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.postController = [[self storyboard] instantiateViewControllerWithIdentifier:@"FRNewPostViewController"];
    self.notifController = [[self storyboard] instantiateViewControllerWithIdentifier:@"FRNotifViewController"];
    self.profileController = [[self storyboard] instantiateViewControllerWithIdentifier:@"FRProfileViewController"];
    self.messagesController = [[self storyboard] instantiateViewControllerWithIdentifier:@"FRMessagesViewController"];
    
}




#pragma mark - Showing/Hiding Child View Controllers

- (void)retractChildViewController: (UIViewController*)vc
{
    [vc willMoveToParentViewController:nil];
    
    float animationDuration = 0.5;
    if([vc isKindOfClass:[FRNewPostViewController class]]) {
        animationDuration = 0;
    }
    
    [UIView animateWithDuration:animationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        vc.view.frame = [self hiddenFrameForViewController:vc];
        
    } completion:^(BOOL finished) {
        [vc didMoveToParentViewController:nil];
        [vc removeFromParentViewController];
        [vc.view removeFromSuperview];
    }];
}


- (void)showChildViewController: (UIViewController*)vc
{
    [self addChildViewController:vc];
    vc.view.frame = [self hiddenFrameForViewController:vc];
    [self.view addSubview:vc.view];
    [vc didMoveToParentViewController:self];
    
    float animationDuration = 0.5;
    if([vc isKindOfClass:[FRNewPostViewController class]]) {
        animationDuration = 0;
    }
    
    [UIView animateWithDuration:animationDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        vc.view.frame = CGRectMake(0, 0, [JPStyle deviceWidth], [JPStyle deviceHeight]);
        
    } completion:^(BOOL finished) {
        [vc didMoveToParentViewController:self];
    }];
    
}


- (CGRect)hiddenFrameForViewController: (UIViewController*)vc
{
    CGRect frame = CGRectZero;
    if([vc isKindOfClass:[FRNotifViewController class]])
    {
        frame = CGRectMake(-[JPStyle deviceWidth], 0, [JPStyle deviceWidth], [JPStyle deviceHeight]);
    }
    else if([vc isKindOfClass:[FRMessagesViewController class]])
    {
        frame = CGRectMake([JPStyle deviceWidth], 0, [JPStyle deviceWidth], [JPStyle deviceHeight]);
    }
    else //vc is a FRProfileViewController class
    {
        frame = CGRectMake(0, [JPStyle deviceHeight], [JPStyle deviceWidth], [JPStyle deviceHeight]);
    }
    
    return frame;
}


#pragma mark - Navigational Controls

- (void)newPostButtonPressed
{
    [self showChildViewController:self.postController];
}

- (void)leftBarButtonPressed
{
    [self showChildViewController:self.notifController];
}

- (void)titlePressed
{
    [self showChildViewController:self.profileController];
}

- (void)rightBarButtonPressed
{
    [self showChildViewController:self.messagesController];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
