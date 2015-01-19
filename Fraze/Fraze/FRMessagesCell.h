//
//  FRMessagesCell.h
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRMessagesCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) IBOutlet UIImageView *readIndicatorView;

@property (weak, nonatomic) IBOutlet UIButton *dropdownButton;

- (void)setup;

@end
