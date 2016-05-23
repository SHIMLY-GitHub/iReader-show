//
//  BookReusableView.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "BookReusableView.h"

@implementation BookReusableView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel * labe = [UILabel new];
        labe.backgroundColor = [UIColor whiteColor];
        [self addSubview:labe];
        labe.frame = CGRectMake(0, 0, frame.size.width, 5);
        
        
        UILabel * bottomLable = [UILabel new];
        bottomLable.backgroundColor = [UIColor colorWithRed:237/255.0f green:239/255.0f blue:241/255.0f alpha:1];
        [self addSubview:bottomLable];
        bottomLable.frame = CGRectMake(0, labe.frame.size.height, frame.size.width, 40);
        
    }
    
    return self;
}
@end
