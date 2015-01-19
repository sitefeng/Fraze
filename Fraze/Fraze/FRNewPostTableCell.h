//
//  FRNewPostTableCellTableViewCell.h
//  Fraze
//
//  Created by Si Te Feng on 1/18/15.
//  Copyright (c) 2015 Si Te Feng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FRNewPostTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *checkmarkView;

@property (nonatomic) BOOL customSelected;

@end
