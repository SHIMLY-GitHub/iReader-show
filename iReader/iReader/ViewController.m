//
//  ViewController.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "ViewController.h"
#import "BookCollectionView.h"
#import "ViewDataManager.h"
#import "BooksViewModel.h"

#define kStatusHeight  [[UIApplication sharedApplication] statusBarFrame].size.height
@interface ViewController ()

@property(nonatomic,strong)ViewDataManager * dataManager;
@property(nonatomic,strong) BookCollectionView * bookView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataManager = [[ViewDataManager alloc] init];
    
      _bookView = [[BookCollectionView alloc] initWithFrame:self.view.frame];

    
    [self.view addSubview:_bookView];
    _bookView.frame = CGRectMake(0, kStatusHeight, self.view.frame.size.width, self.view.frame.size.height-kStatusHeight);
    [self requestBooksJsonData];
    
}
-(void)requestBooksJsonData
{
    [_dataManager requestBooksData:^(NSString *error) {
        [self rendreBookCollectionView];
        
        
    }];
    
}
-(void)rendreBookCollectionView
{
    BooksViewModel * viewModel = [BooksViewModel viewModelWithBooks:self.dataManager.booksArray];
    
    [self.bookView bindWithViewModel:viewModel.booksSectionArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
}

@end
