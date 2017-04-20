//
//  GameViewController.h
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Scene;

@interface GameViewController : UIViewController

@property (nonatomic) Scene *selectedScene;
@property (nonatomic) NSDictionary *selectedSceneDictionary;

@end
