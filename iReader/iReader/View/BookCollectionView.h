//
//  BookCollectionView.h
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BooksViewModel.h"
#import "BooksCollectionViewCellModel.h"
@interface BookCollectionView : UIView
-(void)bindWithViewModel:(NSMutableArray<NSMutableArray<BooksCollectionViewCellModel*> *> *)  bookSourceData;

@end
