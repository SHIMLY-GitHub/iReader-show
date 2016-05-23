//
//  BooksCollectionViewCellModel.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "BooksCollectionViewCellModel.h"

@implementation BooksCollectionViewCellModel
+(BooksCollectionViewCellModel*) viewModelWithBooksModel:(BooksModel*) bookModel
{
    BooksCollectionViewCellModel * viewModel = [[BooksCollectionViewCellModel alloc] init];
    viewModel.booksImage = nil;
    viewModel.booksTitle = bookModel.title;
    
    
    return viewModel;
}
@end
