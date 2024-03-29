//
//  JPGlobal.m
//  JumpPad
//
//  Created by Si Te Feng on 2014-05-14.
//  Copyright (c) 2014 Si Te Feng. All rights reserved.
//

#import "JPGlobal.h"


@implementation JPGlobal


+ (instancetype)instance
{
    static JPGlobal* _instance = nil;
    @synchronized(self)
    {
        if(_instance == nil)
            _instance = [[JPGlobal alloc] init];
    }
    
    return _instance;
}


+ (NSString*)monthStringWithInt: (int)month
{
    
    switch (month)
    {
        case 1:
            return @"January";
        case 2:
            return @"February";
        case 3:
            return @"March";
        case 4:
            return @"April";
        case 5:
            return @"May";
        case 6:
            return @"June";
        case 7:
            return @"July";
        case 8:
            return @"August";
        case 9:
            return @"September";
        case 10:
            return @"October";
        case 11:
            return @"November";
        case 12:
            return @"December";
        default:
            return @"-----";

    }

}


+ (NSString*)ratingStringWithIndex: (NSInteger)index
{
    switch (index)
    {
        case 0:
            return @"Difficulty";
        case 1:
            return @"Professors";
        case 2:
            return @"Schedule";
        case 3:
            return @"Classmates";
        case 4:
            return @"Social";
        case 5:
            return @"Study Env.";
        default:
            return @"";
            
    }
}

+ (NSString*)ratingFullStringWithIndex: (NSInteger)index
{
    switch (index)
    {
        case 0:
            return @"Difficulty";
        case 1:
            return @"Professor Quality";
        case 2:
            return @"Schedule Packedness";
        case 3:
            return @"Classmates";
        case 4:
            return @"Social Enjoyment";
        case 5:
            return @"Study Environment";
        default:
            return @"";
            
    }
    
}



@end
