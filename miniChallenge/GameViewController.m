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

@property (weak, nonatomic) IBOutlet UIView *subjectSelectionView;

@property (weak, nonatomic) IBOutlet UILabel *selectedItemName;
@property (weak, nonatomic) IBOutlet UILabel *selectedItemDescription;

@property (weak, nonatomic) IBOutlet UIButton *selectedItemSubject1;
@property (weak, nonatomic) IBOutlet UIButton *selectedItemSubject2;
@property (weak, nonatomic) IBOutlet UIButton *selectedItemSubject3;
@property (weak, nonatomic) IBOutlet UIButton *selectedItemSubject4;
@property (weak, nonatomic) IBOutlet UIButton *selectedItemSubject5;
@property (weak, nonatomic) IBOutlet UIButton *selectedItemSubject6;


@property(nonatomic) UIView *dismissView;


//@property (weak, nonatomic) IBOutlet UILabel *selectedQuestionText;
//@property (weak, nonatomic) IBOutlet UIButton *selectedQuestionAlternative1;
//@property (weak, nonatomic) IBOutlet UIButton *selectedQuestionAlternative2;
//@property (weak, nonatomic) IBOutlet UIButton *selectedQuestionAlternative3;
//@property (weak, nonatomic) IBOutlet UIButton *selectedQuestionAlternative4;
//@property (weak, nonatomic) IBOutlet UIButton *selectedQuestionAlternative5;


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.width = @(self.view.frame.size.width);
    self.height = @(self.view.frame.size.height);
    
    // Creater the scene
    self.selectedScene = [[Scene alloc] initWithDictionary:self.selectedSceneDictionary withWidth:self.width withHeight:self.height];
    [self.backgroundImage setImage:[UIImage imageNamed:self.selectedScene.name]];
    [self.view addSubview:self.selectedScene];
}

-(void) dismissEverything {
    self.subjectSelectionView.hidden = YES;
    //self.dismissView.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)itemPressed:(UIButton *)sender {
    NSLog(@"An item was pressed!");
    self.selectedItem = (Item *)sender;
    self.subjectSelectionView.hidden = NO;
    self.subjectSelectionView.layer.zPosition = 1;
    
    //self.dismissView.hidden = NO;
}

-(void)updateSubjectSelectionView {
    self.selectedItemName.text = self.selectedItem.itemName;
    
    // We need to add a description for every item before uncommenting the line below.
    //self.selectedItemDescription.text = self.selectedItem.itemDescription;
    
    switch ([self.selectedItem.itemSubjects count]) {
        case 1:
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
            break;
        case 2:
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
            break;
        case 3:
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
            break;
        case 4:
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
            self.selectedItemSubject4.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:3].subjectName;
            break;
        case 5:
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
            self.selectedItemSubject4.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:3].subjectName;
            self.selectedItemSubject5.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:4].subjectName;
            break;
        case 6:
            self.selectedItemSubject1.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:0].subjectName;
            self.selectedItemSubject2.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:1].subjectName;
            self.selectedItemSubject3.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:2].subjectName;
            self.selectedItemSubject4.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:3].subjectName;
            self.selectedItemSubject5.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:4].subjectName;
            self.selectedItemSubject6.titleLabel.text = [self.selectedItem.itemSubjects objectAtIndex:5].subjectName;
            break;
    }
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
