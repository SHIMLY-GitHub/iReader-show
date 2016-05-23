//
//  BooksCollectionViewCellModel.h
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "BooksModel.h"

@interface BooksCollectionViewCellModel : JSONModel
@property(nonatomic,strong)UIImage * booksImage;
@property(nonatomic,strong)NSString *booksTitle;

+(BooksCollectionViewCellModel*) viewModelWithBooksModel:(BooksModel*) bookModel;
@end
