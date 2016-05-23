//
//  BookCell.h
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol longPressDelegate <NSObject>


-(void)longCellPressStatus:(UILongPressGestureRecognizer*) sender;

@end


@interface BookCell : UICollectionViewCell
@property(nonatomic,strong)UILabel * label;
@property(nonatomic,strong)UIView  * bookView;
@property(nonatomic,assign) id<longPressDelegate> deletage;
-(void)bindDataWithBookCell:(NSIndexPath*) indexPath;

@end
