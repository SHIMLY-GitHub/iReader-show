//
//  BooksModel.h
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface BooksModel : JSONModel
@property(nonatomic,strong)NSString<Optional> * title;
@property(nonatomic,strong)NSString<Optional> * group;

@end
