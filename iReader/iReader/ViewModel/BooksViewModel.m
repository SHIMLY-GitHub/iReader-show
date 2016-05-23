//
//  BooksViewModel.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "BooksViewModel.h"
@implementation BooksViewModel
+(BooksViewModel*) viewModelWithBooks:(NSMutableArray<BooksModel*> *) booksModelArray
{
    
    NSMutableArray  <BooksCollectionViewCellModel*> * cellModelArray = [NSMutableArray array];
    
  [booksModelArray enumerateObjectsUsingBlock:^(BooksModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
     
      [cellModelArray addObject:[BooksCollectionViewCellModel viewModelWithBooksModel:obj]];
  }];
    
    NSMutableArray<NSMutableArray<BooksCollectionViewCellModel*> *> * booksSectionArray = [NSMutableArray array];
    
    
    
    for (NSInteger i=0; i<cellModelArray.count; i=i+3) {
        
        NSRange rang = NSMakeRange(i, 3);
        
        
        NSArray<BooksCollectionViewCellModel*> * array =   [cellModelArray subarrayWithRange:rang];
        
        NSMutableArray<BooksCollectionViewCellModel*> * mutableArray = [NSMutableArray arrayWithArray:array];
    
        [booksSectionArray addObject:mutableArray];
   

    }
    
    
    
    BooksViewModel * book = [[BooksViewModel alloc] init];
    book.booksSectionArray = booksSectionArray;
    
    return book;
}
@end
