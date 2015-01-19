//
//  FRNewPostTableCellTableViewCell.m
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRNewPostTableCell.h"

@implementation FRNewPostTableCell





- (void)setCustomSelected:(BOOL)selected
{

    if(selected) {
        self.checkmarkView.image = [UIImage imageNamed:@"checkmark1"];

    } else {
        self.checkmarkView.image = nil;
    }
    
}

@end
