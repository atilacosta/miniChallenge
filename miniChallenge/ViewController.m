//
//  ViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "ViewController.h"
#import "AudioManager.h"
#import <AVFoundation/AVFoundation.h>
#import "User.h"
#import "currentUser.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *settingsButton;
@end

@implementation ViewController

- (IBAction)startGame:(UIButton *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    User *userAux;
    userAux = [[currentUser sharedManager]user];
    [userAux changeMusicStatus];
    
    [[currentUser sharedManager]saveConfiguration];
    
    //Retrieving Data
//    NSUserDefaults *userConfigDefault = [NSUserDefaults standardUserDefaults];
//    NSData *encodedUserConfig = [userConfigDefault objectForKey:@"encodedUser"];
//    User *currentUser = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedUserConfig];
//    if(currentUser == nil){
//        currentUser = [[User alloc]initWithUserId:[NSNumber numberWithInt:1]];
//    }
//    [currentUser changeMusicStatus];
//    if([currentUser isMusicOn]){
//        [[AudioManager sharedManager]playMusic];
//    }
    

    // Do any additional setup after loading the view, typically from a nib.
    //veeejjaaaaa
    //adicionar no git
    //Passos:
    //0 - sempre dar um git pull antes de commitar
    //1 - va para a pasta do projeto via terminal
    //2 - git add .
    //3 - git commit -m "digite a mensagem que representa a mudanca"
    //4 - git push
    
    //Saving Data
//    encodedUserConfig = [NSKeyedArchiver archivedDataWithRootObject:currentUser];
//    [userConfigDefault setObject:encodedUserConfig forKey:@"encodedUser"];
//    [userConfigDefault synchronize];
    
}

- (IBAction)unwindFromView:(UIStoryboardSegue*)sender
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
