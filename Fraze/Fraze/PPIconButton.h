//
//  PPIconButton.h
//  Peep
//
//  Created by Si Te Feng on 11/1/14.
//  Copyright (c) 2014 peeper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPIconButton : UIView
{
    id  _target;
    SEL _action;
    
    UIColor* beforeBackColor;
}

@property (nonatomic, strong) NSCoder* buttonFrame;

//set this
@property (nonatomic, strong) NSString* imageName;

@property (nonatomic, strong) UILabel*     titleLabel;
@property (nonatomic, strong) UIImageView* icon;


- (void)setTitle: (NSString*)title;

- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;


@end
