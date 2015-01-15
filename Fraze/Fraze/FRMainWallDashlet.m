//
//  FRMainWallDashlet.m
//  Fraze
//
//  Created by Si Te Feng on 1/7/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRMainWallDashlet.h"

@implementation FRMainWallDashlet

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    return self;
}


- (void)setup
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = 10;
    
    self.avatarImageView.layer.cornerRadius = self.avatarImageView.frame.size.width/2.0f;
    self.avatarImageView.layer.masksToBounds = YES;
    self.avatarImageView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.2];
    
    [self.upVoteButton setImage:[UIImage imageNamed:@"navyThumb"] forState:UIControlStateNormal];
    [self.upVoteButton setImage:[UIImage imageNamed:@"blueThumb"] forState:UIControlStateSelected];
}



@end
