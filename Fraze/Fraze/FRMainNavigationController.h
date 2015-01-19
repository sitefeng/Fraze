//
//  FRMainNavigationController.h
//  Fraze
//
//  Created by Si Te Feng on 1/15/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRMainNavigationController : UINavigationController


- (void)retractChildViewController: (UIViewController*)vc;


- (void)newPostButtonPressed;
- (void)leftBarButtonPressed;
- (void)rightBarButtonPressed;
- (void)titlePressed;


@end
