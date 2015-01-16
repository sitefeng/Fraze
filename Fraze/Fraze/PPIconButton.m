//
//  PPIconButton.m
//  Peep
//
//  Created by Si Te Feng on 11/1/14.
//  Copyright (c) 2014 peeper. All rights reserved.
//

#import "PPIconButton.h"


NSString* const buttonColor = @"FFFFFF";

NSString* const pressedColor = @"AFAFAF";
NSString* const pressedBackground = @"FFFFFF";


@implementation PPIconButton

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    self = [self initWithFrame:CGRectZero];
    
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    self.icon = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.height * 0.1, frame.size.height * 0.1, frame.size.height*0.8, frame.size.height*0.8)];
    self.icon.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.icon];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.height, frame.size.height * 0.1, frame.size.width - frame.size.height*1.1, frame.size.height*0.8)];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textColor = [JPStyle colorWithHex:buttonColor alpha:1];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.text = @"Button";
    [self addSubview:self.titleLabel];
    
    UILongPressGestureRecognizer* longRec = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    longRec.minimumPressDuration = 0.0f;
    [self addGestureRecognizer:longRec];
    
    return self;
}


- (void)layoutSubviews
{
    CGRect frame = self.frame;
    self.icon.frame = CGRectMake(frame.size.height * 0.1, frame.size.height * 0.1, frame.size.height*0.8, frame.size.height*0.8);
    self.titleLabel.frame = CGRectMake(frame.size.height, frame.size.height * 0.1, frame.size.width - frame.size.height*1.1, frame.size.height*0.8);
    
}


- (void)setTitle: (NSString*)title
{
    self.titleLabel.text = title;
    
}

- (void)setImageName:(NSString *)name
{
    _imageName = name;
    self.icon.image = [[UIImage imageNamed:name]imageWithColor:[JPStyle colorWithHex:buttonColor alpha:1]];
}

- (void)longPressed: (UILongPressGestureRecognizer*)rec
{
    if(rec.state == UIGestureRecognizerStateBegan)
    {
        beforeBackColor = self.backgroundColor;
        self.backgroundColor = [JPStyle colorWithHex:pressedBackground alpha:0.2];
        self.titleLabel.textColor = [JPStyle colorWithHex:pressedColor alpha:1];
        UIImage* settings = [[UIImage imageNamed:self.imageName] imageWithColor:[JPStyle colorWithHex:pressedColor alpha:1]];
        self.icon.image = settings;

    }
    else if(rec.state == UIGestureRecognizerStateEnded)
    {
        self.backgroundColor = beforeBackColor;
        self.titleLabel.textColor = [JPStyle colorWithHex:buttonColor alpha:1];
        UIImage* img = [[UIImage imageNamed:self.imageName] imageWithColor:[JPStyle colorWithHex:buttonColor alpha:1]];
        self.icon.image = img;

        [_target performSelector:_action withObject:nil];
    }
}


- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents
{
    if(controlEvents == UIControlEventTouchUpInside)
    {
        _target = target;
        _action = action;
    }
}





@end
