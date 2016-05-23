//
//  BookCollectionView.m
//  iReader
//
//  Created by shimly on 16/5/23.
//  Copyright © 2016年 shimly. All rights reserved.
//

#import "BookCollectionView.h"
#import "BookCell.h"
#import "BookReusableView.h"
@interface BookCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource,longPressDelegate>
@property(nonatomic,strong) UICollectionView * bookCollectionView;
@property(nonatomic,assign)CGFloat collectionWidth;
@property(nonatomic,strong) NSMutableArray<NSMutableArray<BooksCollectionViewCellModel*> *>  * dataSourceArray;
@end;

@implementation BookCollectionView
-(id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.collectionWidth = frame.size.width;
      
        [self stupCollectionView];
        
    }
    
    
    return self;
}

-(void)stupCollectionView
{
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    layout.footerReferenceSize  = CGSizeMake(self.collectionWidth, 45);
    //layout.minimumInteritemSpacing = 10;
   // layout.minimumLineSpacing = 0;
    CGFloat itemWidth = self.collectionWidth/3-25;
    layout.itemSize = CGSizeMake(itemWidth, itemWidth*1.2);
    _bookCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    
    _bookCollectionView.backgroundColor = [UIColor colorWithRed:237/255.0f green:239/255.0f blue:241/255.0f alpha:1];
    _bookCollectionView.delegate = self;
    _bookCollectionView.dataSource = self;
 
    [self addSubview:_bookCollectionView];
    [_bookCollectionView registerClass:[BookCell class] forCellWithReuseIdentifier:@"BookCell"];
    [_bookCollectionView registerClass:[BookReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView"];
    
}
-(UICollectionReusableView*) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (kind ==UICollectionElementKindSectionFooter) {
    
        BookReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footerView" forIndexPath:indexPath];
       
     
        return view;
        
    }
    
    return nil;
    
}
-(UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BookCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BookCell" forIndexPath:indexPath];
    cell.deletage = self;
    [cell bindDataWithBookCell:indexPath];
    
    return cell;
}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSMutableArray<BooksCollectionViewCellModel*> * array = [self.dataSourceArray objectAtIndex:section];
    
    return  array.count;
}


-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    

    NSMutableArray<BooksCollectionViewCellModel*> * array = [self.dataSourceArray objectAtIndex:sourceIndexPath.section];
    BooksCollectionViewCellModel * viewModel = [array objectAtIndex:sourceIndexPath.row];
    [array removeObject:viewModel];
 
    
    NSMutableArray<BooksCollectionViewCellModel*> * destArray = [self.dataSourceArray objectAtIndex:destinationIndexPath.section];
    
    [destArray insertObject:viewModel atIndex:destinationIndexPath.row];
  
}

-(void)longCellPressStatus:(UILongPressGestureRecognizer *)sender
{
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        NSIndexPath * indexPath = [_bookCollectionView indexPathForItemAtPoint:[sender locationInView:self.bookCollectionView]];
        
        if (indexPath!=nil) {
            
            [_bookCollectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        }
        
      
    }else if (sender.state==UIGestureRecognizerStateChanged)
    {
        
        [_bookCollectionView updateInteractiveMovementTargetPosition:[sender locationInView:self.bookCollectionView]];
    }else if (sender.state==UIGestureRecognizerStateEnded)
    {
        [_bookCollectionView endInteractiveMovement];
    }else if (sender.state==UIGestureRecognizerStateFailed)
    {
        [_bookCollectionView cancelInteractiveMovement];
    }
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataSourceArray.count;
}
-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
-(void)bindWithViewModel:(NSMutableArray<NSMutableArray<BooksCollectionViewCellModel*> *> *)  bookSourceData
{
    
    self.dataSourceArray = bookSourceData;
    [_bookCollectionView reloadData];
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}





@end
