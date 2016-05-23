//
//  BooksViewModel.h
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "BooksModel.h"
#import "BooksCollectionViewCellModel.h"
@interface BooksViewModel : JSONModel

@property(nonatomic,strong)NSMutableArray<NSMutableArray<BooksCollectionViewCellModel*> *> * booksSectionArray;
+(BooksViewModel*) viewModelWithBooks:(NSMutableArray<BooksModel*> *) booksModelArray;
@end
