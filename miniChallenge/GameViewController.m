//
//  GameViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "GameViewController.h"
#import "Scene.h"
#import "Item.h"
#import "Subject.h"

@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *selectedItemName;
@property (weak, nonatomic) IBOutlet UILabel *selectedItemDescription;

@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectOne;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectTwo;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectThree;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectFour;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectFive;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectSix;

@property (weak, nonatomic) IBOutlet UIView *subjectView;
@property (weak, nonatomic) IBOutlet UIView *intermediateView;

@property (nonatomic) NSArray *buttonArray;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.width = @(self.view.frame.size.width);
    self.height = @(self.view.frame.size.height);
    
    // Create the scene
    self.selectedScene = [[Scene alloc] initWithDictionary:self.selectedSceneDictionary withWidth:self.width withHeight:self.height];
    [self.backgroundImage setImage:[UIImage imageNamed:self.selectedScene.name]];
    [self.view addSubview:self.selectedScene];
    
    for(Item *current in self.selectedScene.itemsList){
        [current addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.subjectView.hidden = YES;
    
    self.buttonArray = [[NSArray alloc]initWithObjects:self.selectedSubjectOne, self.selectedSubjectTwo,self.selectedSubjectThree,self.selectedSubjectFour,self.selectedSubjectFive, self.selectedSubjectSix, nil];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissViews)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    
}

- (void)dismissViews{
    [self.subjectView setHidden:YES];
    [self.intermediateView setHidden:YES];
    [self enableButtons];
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (CGRectContainsPoint(self.subjectView.bounds, [touch locationInView:self.subjectView]))
        return NO;
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)itemPressed:(UIButton *)sender{
    
    if(self.selectedItem != (Item *)sender){
        self.selectedItem = (Item *)sender;
    }
    [self showSubjectView];
    

}
    
- (void)showSubjectView{
    [self updateSubjectView];
    self.subjectView.layer.zPosition = 2;
    self.intermediateView.layer.zPosition = 1;
    self.intermediateView.userInteractionEnabled = NO;
    [self disableButtons];
    [self.intermediateView setHidden:NO];
    [self.subjectView setHidden:NO];
}

-(void)disableButtons{
    for(Item *current in self.selectedScene.itemsList){
        [current setEnabled:NO];
    }
}

-(void)enableButtons{
    for(Item *current in self.selectedScene.itemsList){
        [current setEnabled:YES];
    }
}

- (void)updateSubjectView{
    
    self.selectedItemName.text = self.selectedItem.itemName;
    self.selectedItemDescription.text = nil;
    [self setButtonName];
    
}

- (void)setButtonName{
    NSUInteger index;
    for(UIButton *current in self.buttonArray){
        if([self.buttonArray indexOfObject:current] < [self.selectedItem.itemSubjects count]){
            index = [self.buttonArray indexOfObject:current];
            [current setEnabled:YES];
            [current setTitle:[[self.selectedItem.itemSubjects objectAtIndex:index] subjectName] forState:UIControlStateNormal];
            [current.titleLabel sizeToFit];
        }else{
            [current setEnabled:NO];
            [current setTitle:@"" forState:UIControlStateDisabled];
            
        }
    }
}





//- (IBAction)itemPressed:(UIButton *)sender {
//    NSLog(@"An item was pressed!");
//    self.selectedItem = (Item *)sender;
//    if(![self verifySelectionView:self.selectedItem]){
//        self.subjectSelectionView.hidden = NO;
//        self.subjectSelectionView.layer.zPosition = 1;
//        //self.dismissView.hidden = NO;
//        [self updateSubjectSelectionView];
//    }
//    
//    //self.selectedItem = NULL;
//}
//
//-(void)clearSubjectViewContent{
//    self.selectedItemName.text = nil;
//    self.selectedItemDescription.text = nil;
//    //self.selectedItemSubject1.titleLabel.hidden = YES;
//    self.selectedItemSubject2.titleLabel.text = @"";
//    self.selectedItemSubject3.titleLabel.text = nil;
//    self.selectedItemSubject4.titleLabel.text = nil;
//    self.selectedItemSubject5.titleLabel.text = nil;
//    self.selectedItemSubject6.titleLabel.text = nil;
//}
//
//- (BOOL)verifySelectionView:(Item *)item{
//    if(self.selectedItemName.text == item.itemName){
//        return YES;
//    }
//    return NO;
//}
//
//-(void)updateSubjectSelectionView {
//    self.selectedItemName.text = self.selectedItem.itemName;
//    
//    // We need to add a description for every item before uncommenting the line below.
//    //self.selectedItemDescription.text = self.selectedItem.itemDescription;
//    
//    switch ([self.selectedItem.itemSubjects count]) {
//        case 1:
//            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
//            break;
//        case 2:
//            
//            
//            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
//            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
//            self.selectedItemSubject3.titleLabel.hidden = YES;
//            self.selectedItemSubject4.titleLabel.hidden = YES;
//            //self.selectedItemSubject1.titleLabel.text =
//            //self.selectedItemSubject2.titleLabel.text =
//            break;
//        case 3:
//            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
//            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
//            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
//            break;
//        case 4:
//            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
//            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
//            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
//            self.selectedItemSubject4.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:3].subjectName;
//            break;
//        case 5:
//            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
//            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
//            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
//            self.selectedItemSubject4.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:3].subjectName;
//            self.selectedItemSubject5.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:4].subjectName;
//            break;
//        case 6:
//            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
//            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
//            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
//            self.selectedItemSubject4.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:3].subjectName;
//            self.selectedItemSubject5.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:4].subjectName;
//            self.selectedItemSubject6.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:5].subjectName;
//            break;
//    }
//}
//
///*
//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/

@end
