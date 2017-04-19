//
//  CharacterViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "CharacterViewController.h"
#import "CharCollectionViewCell.h"
#import "GameViewController.h"
@interface CharacterViewController  () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *charCollectionView;
@property NSArray *charArray;
@property CGFloat cellScale;
@end

@implementation CharacterViewController

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
//    UICollectionViewFlowLayout *layout = _charCollectionView.collectionViewLayout;
//    CGFloat cellWidth = layout.itemSize.width + layout.minimumLineSpacing;
//    CGPoint offset = *targetContentOffset;
//    NSLog(@"offset");
//    double index = (offset.x + scrollView.contentInset.left) / cellWidth;
//    int roundIndex = round(index);
//    offset = CGPointMake(roundIndex * cellWidth - scrollView.contentInset.left, -scrollView.contentInset.top);
//    NSArray<CharCollectionViewCell *> *visibleCells = _charCollectionView.visibleCells;
//    
//    [UIView animateWithDuration:0.5 animations:^{
//         *targetContentOffset = offset;
//    }];
    NSIndexPath *indexPath =
    [self.charCollectionView indexPathForItemAtPoint:
     [self.view convertPoint:[self.view center] toView:self.charCollectionView]];
    NSLog(@"%f",_charCollectionView.center.x);
    [self.charCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CharCollectionViewCell *cell = [_charCollectionView dequeueReusableCellWithReuseIdentifier:@"charCell" forIndexPath:indexPath];
    cell.characterForCell = @"oi";
    //NSLog(@"%f",cell.charImage.frame.size.width);
    return cell;
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    GameViewController *dest = segue.destinationViewController;
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSArray *scenesList = [[NSArray alloc]initWithContentsOfFile:filePath ];
    _charArray = scenesList;
    _charCollectionView.dataSource = self;
    _charCollectionView.delegate = self;
    _cellScale = 0.5;
    CGSize screenSize = _charCollectionView.frame.size;
    CGFloat cellHeight = (screenSize.width * _cellScale);
    CGFloat cellWidth = (screenSize.height * _cellScale);
    CGFloat insetY = (screenSize.width - cellHeight) / 2.0;
    CGFloat insetX = (screenSize.height - cellWidth) / 2.0;
    UICollectionViewFlowLayout *layout = _charCollectionView.collectionViewLayout;
    layout.itemSize = CGSizeMake(cellWidth, cellHeight);
    layout.minimumLineSpacing = cellWidth/5;
    layout.sectionInset = UIEdgeInsetsMake(insetY, insetX * 2.5, insetY, insetX * 2.5);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
