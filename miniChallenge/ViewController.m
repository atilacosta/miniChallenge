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
    if([userAux isMusicOn]){
        NSLog(@"TESTE");
    }
    if([userAux isMusicOn]){
        [[AudioManager sharedManager]playMusic];
    }
    [[currentUser sharedManager]saveConfiguration];
    
    //adicionar no git
    //Passos:
    //0 - sempre dar um git pull antes de commitar
    //1 - va para a pasta do projeto via terminal
    //2 - git add .
    //3 - git commit -m "digite a mensagem que representa a mudanca"
    //4 - git push
}

- (IBAction)unwindFromView:(UIStoryboardSegue*)sender
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
