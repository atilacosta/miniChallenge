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
#import "Question.h"
#import "currentUser.h"
#import "User.h"

@interface GameViewController ()

// Where we are at right now: We have almost completed the questionView. Next task is to add the action alternativePressed and its outcomes.

@property (weak, nonatomic) IBOutlet UIView *subjectView;

@property (weak, nonatomic) IBOutlet UILabel *selectedItemName;
@property (weak, nonatomic) IBOutlet UILabel *selectedItemDescription;

@property (nonatomic) NSArray *buttonArray;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectOne;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectTwo;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectThree;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectFour;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectFive;
@property (weak, nonatomic) IBOutlet UIButton *selectedSubjectSix;


@property (weak, nonatomic) IBOutlet UIView *intermediateView;


@property (weak, nonatomic) IBOutlet UIView *questionView;
@property (weak, nonatomic) IBOutlet UILabel *selectedQuestionText;

@property (nonatomic) NSArray *alternativesArray;
@property (weak, nonatomic) IBOutlet UIButton *selectedAlternativeOne;
@property (weak, nonatomic) IBOutlet UIButton *selectedAlternativeTwo;
@property (weak, nonatomic) IBOutlet UIButton *selectedAlternativeThree;
@property (weak, nonatomic) IBOutlet UIButton *selectedAlternativeFour;
@property (weak, nonatomic) IBOutlet UIButton *selectedAlternativeFive;



@property (weak, nonatomic) IBOutlet UIView *resultView;

@property (weak, nonatomic) IBOutlet UILabel *resultText;
@property (weak, nonatomic) IBOutlet UILabel *resultHint;

@property (weak, nonatomic) IBOutlet UIButton *nextQuestionInSubject;
@property (weak, nonatomic) IBOutlet UIButton *goBackToObject;
@property (weak, nonatomic) IBOutlet UIButton *goBackToScene;

@property (weak, nonatomic) IBOutlet UILabel *playerScore;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

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
    
    // Makes all items respond to being touched by opening the subjectView.
    for(Item *current in self.selectedScene.itemsList){
        [current addTarget:self action:@selector(itemPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    // Initializes the subject buttons array with the outlets.
    self.buttonArray = [[NSArray alloc]initWithObjects:self.selectedSubjectOne, self.selectedSubjectTwo,self.selectedSubjectThree,self.selectedSubjectFour,self.selectedSubjectFive, self.selectedSubjectSix, nil];
    
    
    
    // Make all subject buttons respond to the subjectPressed, which updates the selectedSubject.
    for(UIButton *current in self.buttonArray){
        [current addTarget:self action:@selector(subjectPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    
    // Initializes the alternatives array with the outlet button objects.
    self.alternativesArray = [[NSArray alloc] initWithObjects:self.selectedAlternativeOne, self.selectedAlternativeTwo, self.selectedAlternativeThree, self.selectedAlternativeFour, self.selectedAlternativeFive, nil];
    
    // Make all alternatve buttons respond to the alternativePressed, which updates the selectedAlternative.
    for(UIButton *current in self.alternativesArray){
        [current addTarget:self action:@selector(alternativePressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    // Result View Part
    // next random in s=ob and subje
    [self.nextQuestionInSubject addTarget:self action:@selector(subjectPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.goBackToObject addTarget:self action:@selector(showSubjectView) forControlEvents:UIControlEventTouchUpInside];
    [self.goBackToScene addTarget:self action:@selector(dismissViews) forControlEvents:UIControlEventTouchUpInside];
    
    self.userPoints = [[currentUser sharedManager] user].playerPoints;
    
    [self.selectedScene addSubview:self.backButton];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissViews)];
    tap.delegate = self;
    [self.view addGestureRecognizer:tap];
    NSLog(@"-------------- %ld --------------",(long)_selectedScene.TotalNumberOfQuestions);

}

- (void)dismissViews{
    if(self.questionView.hidden == YES){   // This was added so that it is impossible to "dodge the question" by tapping the background
        [self.subjectView setHidden:YES];
        [self.intermediateView setHidden:YES];
        [self.questionView setHidden:YES];
        [self.resultView setHidden:YES];
        self.selectedScene.userInteractionEnabled = YES;
        [self enableButtons];
    }
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ( CGRectContainsPoint(self.subjectView.bounds, [touch locationInView:self.subjectView]) )
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

- (IBAction)subjectPressed:(UIButton *)sender{
    if(![sender.titleLabel.text isEqualToString:self.selectedItem.itemName]){// This is false if the user is coming from the resultView
        self.selectedSubject = [self.selectedItem subjectByName:sender.titleLabel.text];
    }
    
    //Verify if Subject still has unanswered questions if it does shows question view. If it doesnt: Think about it
    if([self.selectedSubject hasQuestionsAvaiable]){
        self.selectedQuestion = [self.selectedSubject getRandomUnansweredQuestion];
    } else{
        self.selectedQuestion = nil;
    }
    [self showQuestionView];
}

- (IBAction)alternativePressed:(UIButton *)sender{
    self.selectedAlternative = sender.titleLabel.text;
    
    // question = errar ou acertar (dismiss blocked)
    // resultView tem 3 outcomes: voltar pra scene(dismiss), voltar pro subjectSelection, next question
    // dismiss em tudo

    [self showResultView];
}
    
- (void)showSubjectView{
    [self updateSubjectView];
    self.subjectView.layer.zPosition = 2;
    self.intermediateView.layer.zPosition = 1;
    self.intermediateView.userInteractionEnabled = NO;
    self.selectedScene.userInteractionEnabled = NO;
    [self disableButtons];
    
    [self.questionView setHidden:YES];
    [self.resultView setHidden:YES];
    
    [self.intermediateView setHidden:NO];
    [self.subjectView setHidden:NO];
}

// 1 - DONE
- (void)showQuestionView{
    [self updateQuestionView];
    self.questionView.layer.zPosition = 3;
    
    
    if([self.selectedSubject hasQuestionsAvaiable]){
        [self.resultView setHidden:YES];
        [self.intermediateView setHidden:NO];
        [self.questionView setHidden:NO];
    } else{
        [self showResultView];
    }
    
}

- (void)showResultView{
    [self updateResultView];
    self.resultView.layer.zPosition = 4;
    
    [self.questionView setHidden:YES];
    [self.resultView setHidden:NO];
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

// 2 - DONE
- (void)updateQuestionView{
    self.selectedQuestionText.text = self.selectedQuestion.question;
    [self setAlternativesName];
}

- (void)updateResultView{
    if (self.selectedQuestion == nil) {
        self.resultText.text = @"There are no more avaible questions for this subject at the moment";
        self.resultHint.text = @"Try another subject";
        self.resultText.textColor = [UIColor blackColor];
    }else {
        if([self.selectedQuestion gradeQuestionWithAlternative:self.selectedAlternative]){ // The answer is correct
            self.resultText.text = @"Correct!!";
            self.resultHint.text = @"";
            self.resultText.textColor = [UIColor greenColor];
            // show and update score
            
            NSLog(@"%@", self.selectedQuestion.uniqueID);
            
            [self incrementPlayerScore:self.selectedQuestion.value];
            [[[currentUser sharedManager] user] insertAnsweredQuestionsId:self.selectedQuestion.uniqueID];
            
        } else {
            self.resultText.text = @"Incorrect!!";
            self.resultText.textColor = [UIColor redColor];
            self.resultHint.text = self.selectedQuestion.hint;
        }
    }
    // Update the buttons:
    
    
    [UIView performWithoutAnimation:^{ // This gay ass block is just to fix the problem where a unwanted animation is played.
        [self.nextQuestionInSubject setTitle:self.selectedSubject.subjectName forState:UIControlStateNormal];
        [self.goBackToObject setTitle:self.selectedItem.itemName forState:UIControlStateNormal];
        [self.nextQuestionInSubject layoutIfNeeded];
        [self.goBackToObject layoutIfNeeded];
    }];
}

- (void)setButtonName{
    NSUInteger index;
    for(UIButton *current in self.buttonArray){
        if([self.buttonArray indexOfObject:current] < [self.selectedItem.itemSubjects count]){
            index = [self.buttonArray indexOfObject:current];
            [current setEnabled:YES];
            
            [UIView performWithoutAnimation:^{
                [current setTitle:[[self.selectedItem.itemSubjects objectAtIndex:index] subjectName] forState:UIControlStateNormal];
                [current layoutIfNeeded];
            }];
            
            
            
            [current.titleLabel sizeToFit];
        }else{
            [current setEnabled:NO];
            [current setTitle:@"" forState:UIControlStateDisabled];
            
        }
    }
}

// 3 - DONE
- (void)setAlternativesName{
    // Create a copy of the question's list of alternatives (so we can edit it)
    NSMutableArray<NSMutableString *> *questionAlternatives = [[NSMutableArray alloc] initWithArray:self.selectedQuestion.choices];
    
    for(UIButton *current in self.alternativesArray){
        if([self.alternativesArray indexOfObject:current] < [questionAlternatives count]){
            [current setEnabled:YES];
            
            int randIndex;
            do {
                randIndex = arc4random_uniform((int)[questionAlternatives count]); // Get a random Index
            }while([[questionAlternatives objectAtIndex:randIndex] isEqual:@"*"]); // Only leave after we found a not * object
            
            
            [UIView performWithoutAnimation:^{ // This gay ass block is just to fix the problem where a unwanted animation is played.
                [current setTitle:[questionAlternatives objectAtIndex:randIndex] forState:UIControlStateNormal];// Set outlet to the random
                [current layoutIfNeeded];
            }];
            
            [questionAlternatives replaceObjectAtIndex:randIndex withObject: [NSMutableString stringWithString:@"*" ] ]; // Change to * so it's not used again
            
            [current.titleLabel sizeToFit];
        }else{
            [current setEnabled:NO];
            [current setTitle:@"" forState:UIControlStateDisabled];
        }
    }
    // This below is the old version of the method, which doesn't include the random order of alternatives.
    
//    NSInteger index;
//    for(UIButton *current in self.alternativesArray){
//        if([self.alternativesArray indexOfObject:current] < [self.selectedQuestion.choices count]){
//            index = [self.alternativesArray indexOfObject:current];
//            [current setEnabled:YES];
//            [current setTitle:[self.selectedQuestion.choices objectAtIndex:index] forState:UIControlStateNormal];
//            [current.titleLabel sizeToFit];
//        }else{
//            [current setEnabled:NO];
//            [current setTitle:@"" forState:UIControlStateDisabled];
//            
//        }
//    }
}

- (void)incrementPlayerScore:(int)questionPoints{
    
    self.userPoints = @([self.userPoints intValue] + questionPoints);
    [[currentUser sharedManager] user].playerPoints = self.userPoints;
    [self updatePoints];
    
}

- (void)updatePoints{
    [self.playerScore setText:[NSString stringWithFormat:@"%@", self.userPoints]];
}


// To do:
// resultView update score add question to answered in user. update label. and add score to user overall score.
// Incorrent: update hint outlet.
// Back.
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
