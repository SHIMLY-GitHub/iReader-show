//
//  BookCell.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "BookCell.h"
#import "UIView+AutoLayout.h"

@implementation BookCell
-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor yellowColor];
        UILongPressGestureRecognizer * pressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
        [self addGestureRecognizer:pressGesture];
        
        
        UIView * view = [UIView newAutoLayoutView];
        view.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:view];
        [view autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
        [view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
        [view autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
        [view autoMatchDimension:ALDimensionHeight toDimension:ALDimensionHeight ofView:self.contentView withMultiplier:0.8];
  
    }
    
    return self;
}

-(void)bindDataWithBookCell:(NSIndexPath*) indexPath
{
    
    self.label.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
}

-(void)longPressGesture:(UILongPressGestureRecognizer*) sender
{
    
    if ([self.deletage respondsToSelector:@selector(longCellPressStatus:)]) {
        
        [self.deletage performSelector:@selector(longCellPressStatus:) withObject:sender];
    }
  
    
}















@end
