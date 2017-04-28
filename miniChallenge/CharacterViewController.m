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
#import <AVFoundation/AVFoundation.h>
#import "User.h"
#import "currentUser.h"

@interface CharacterViewController  () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *charCollectionView;
@property NSArray<NSDictionary *> *charArray;
@property CGFloat cellScale;
@property (nonatomic) NSDictionary *selectedSceneDictionary;
@property CGRect imageSize;
@property CGSize selectedImageSize;
@property NSInteger count;

@end

@implementation CharacterViewController

#pragma mark -Segue
//--------------------//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    GameViewController *destView = segue.destinationViewController;
    CharacterViewController *sourceView = segue.sourceViewController;
    destView.selectedSceneDictionary = sourceView.selectedSceneDictionary;
    
}
//--------------------//
#pragma mark CollectionViewAnimation
//--------------------//
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    
    NSIndexPath *indexPath =
    [self.charCollectionView indexPathForItemAtPoint:
     [self.view convertPoint:[self.view center] toView:self.charCollectionView]];
    //NSLog(@"%f",_charCollectionView.center.x);
    [self.charCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    CharCollectionViewCell *currentCell = [self.charCollectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5 animations:^{
        [currentCell.charImage setFrame:CGRectMake(0,0,_selectedImageSize.width,_selectedImageSize.height)];
    }];
    self.selectedSceneDictionary = _charArray[indexPath.item];
}

//--------------------//
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    NSIndexPath *indexPath =
    [self.charCollectionView indexPathForItemAtPoint:
     [self.view convertPoint:[self.view center] toView:self.charCollectionView]];
    //NSLog(@"%f",_charCollectionView.center.x);
    CharCollectionViewCell *currentCell = [self.charCollectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5 animations:^{
        [currentCell.charImage setFrame:_imageSize];
    }];
    
}
//--------------------//
#pragma mark CollectionViewData
//--------------------//

-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CharCollectionViewCell *currentCell = [self.charCollectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.5 animations:^{
        [currentCell.charImage setFrame:_imageSize];
    }];
}
//--------------------//
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//--------------------//
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //NSLog(@"%d",_charArray.count);
    return _charArray.count;
}
//--------------------//
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CharCollectionViewCell *cell = [_charCollectionView dequeueReusableCellWithReuseIdentifier:@"charCell" forIndexPath:indexPath];
    cell.cellScene = _charArray[indexPath.item];
    if(indexPath.item >= _count){
        cell.charImage.image = [UIImage imageNamed:@"any"];
    }
    
    

    return cell;
}
//--------------------//
#pragma mark VIEWLOAD
//--------------------//
- (void)viewDidLoad {
    

//    NSDictionary *oneScene = [[NSDictionary alloc] initWithObjectsAndKeys:
//                               @"outer space",@"sceneName",
//                               @"outerSpace.png",@"sceneImage",nil];
//   _charArray = [NSArray arrayWithObjects:oneScene,oneScene, nil];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"database" ofType:@"plist"];
    NSArray *scenesList = [[NSArray alloc]initWithContentsOfFile:filePath ];
    _charArray = scenesList;
    _charCollectionView.dataSource = self;
    _charCollectionView.delegate = self;
    _count = [[[[currentUser sharedManager]user] numberOfCharacters] intValue];
    
    //---------------//
    
    
//    _cellScale = 0.4;
//    CGSize screenSize = _charCollectionView.frame.size;
//    CGFloat cellHeight = (screenSize.width * _cellScale);
//    CGFloat cellWidth = (screenSize.height * _cellScale);
    UICollectionViewFlowLayout *layout = _charCollectionView.collectionViewLayout;
    _selectedImageSize = layout.itemSize;
    CGFloat insetX = (self.view.frame.size.width / 2.0) - (layout.itemSize.width/2.0);
//    layout.itemSize = CGSizeMake(cellWidth, cellHeight);
//
    
    layout.minimumInteritemSpacing = self.view.frame.size.width/20;
    layout.sectionInset = UIEdgeInsetsMake(0, insetX, 0,insetX);
    
}
-(void)viewDidAppear:(BOOL)animated{
    CharCollectionViewCell *currentCell = [self.charCollectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    _imageSize = currentCell.charImage.frame;
    [UIView animateWithDuration:0.2 animations:^{
        
        [self.charCollectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        [currentCell.charImage setFrame:CGRectMake(0,0,_selectedImageSize.width,_selectedImageSize.height)];
    }];
    self.selectedSceneDictionary = currentCell.cellScene;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//------------------//
-(void)setSelectedSceneDictionary:(NSDictionary *)selectedSceneDictionary{
    _selectedSceneDictionary = selectedSceneDictionary;
    //NSLog(@"Scene name: %@", _selectedSceneDictionary);
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
