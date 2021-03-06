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
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;
@end

@implementation ViewController

- (IBAction)startGame:(UIButton *)sender {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    User *userAux;
    userAux = [[currentUser sharedManager]user];
    //[[[currentUser sharedManager]user]changeMusicStatus];
    [[currentUser sharedManager]saveConfiguration];
    if([userAux isMusicOn]){
        [[AudioManager sharedManager]toggle];
    }
    
    //adicionar no git
    //Passos:
    //0 - sempre dar um git pull antes de commitar
    //1 - va para a pasta do projeto via terminal
    //2 - git add .
    //3 - git commit -m "digite a mensagem que representa a mudanca"
    //4 - git push
}

- (IBAction)unwindFromSettings:(UIStoryboardSegue*)sender
{
    
}
- (IBAction)unwindFromCharSelect:(UIStoryboardSegue*)sender
{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toogleSound:(id)sender {
}

- (IBAction)toogleMusic:(id)sender {
    [[[currentUser sharedManager] user] changeMusicStatus];
    [[currentUser sharedManager] saveConfiguration];
    [[AudioManager sharedManager] toggle];
    if([[[AudioManager sharedManager] player] isPlaying]){
        [sender setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
        //[[currentUser sharedManager]user]
    }
    else{
        [sender setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
    }
    

}

- (IBAction)resetProgress:(id)sender {
    [[[currentUser sharedManager] user] initWithUserId:[NSNumber numberWithInt:1]];
    [[currentUser sharedManager] saveConfiguration];
    if([[[currentUser sharedManager] user] isMusicOn]){
        [self.musicButton setBackgroundImage:[UIImage imageNamed:@"music_on"] forState:UIControlStateNormal];
    }
    else{
        [self.musicButton setBackgroundImage:[UIImage imageNamed:@"music_off"] forState:UIControlStateNormal];
    }
}

@end
