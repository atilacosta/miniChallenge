//
//  GameViewController.h
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Scene;
@class Item;
@class Subject;
@class Question;


@interface GameViewController : UIViewController <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (nonatomic) Scene *selectedScene;
@property (nonatomic) NSDictionary *selectedSceneDictionary;

@property (nonatomic) Item *selectedItem;

@property (nonatomic) Subject *selectedSubject;

@property (nonatomic) Question *selectedQuestion;

@property (nonatomic) NSString *selectedAlternative;

@property (nonatomic) NSNumber *userPoints;

@property (nonatomic) BOOL hasAnswers;

@property (nonatomic) NSNumber *width;
@property (nonatomic) NSNumber *height;

@end
