//
//  ViewDataManager.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "ViewDataManager.h"

@implementation ViewDataManager
-(id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(void)requestBooksData:(void(^)(NSString * error)) complate
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        NSString *path =  [[NSBundle mainBundle] pathForResource:@"books" ofType:@"json"];
        
        NSFileManager * fileManager = [NSFileManager defaultManager];
        
        if ([fileManager fileExistsAtPath:path]) {
            NSData * data = [NSData dataWithContentsOfFile:path];
            
            
            NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:NULL];
            
            NSError * error = nil;
          NSMutableArray * mutableArray =   [BooksModel arrayOfModelsFromDictionaries:[dic valueForKey:@"books"] error:&error];
            self.booksArray = mutableArray;
            if (!error) {
                complate(nil);
            }else{
                complate(error.description);
            }
            
        }else{
            complate(@"没有找到文件");
        }
        
    });
    
}
@end
