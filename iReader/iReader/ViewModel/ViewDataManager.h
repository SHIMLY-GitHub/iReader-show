//
//  ViewDataManager.h
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BooksModel.h"
@interface ViewDataManager : NSObject

@property(nonatomic,strong)NSMutableArray<BooksModel*> * booksArray;

-(void)requestBooksData:(void(^)(NSString * error)) complate;
@end
