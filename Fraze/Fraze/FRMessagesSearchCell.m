//
//  FRMessagesSearchCell.m
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import "FRMessagesSearchCell.h"

@implementation FRMessagesSearchCell

- (void)setup
{
    self.searchTextField.clearButtonMode = UITextFieldViewModeAlways;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
