//
//  FRMessagesCell.m
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRMessagesCell.h"

@implementation FRMessagesCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];

    return self;
}

- (void)setup
{
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = 58/2.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
