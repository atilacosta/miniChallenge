//
//  SettingsViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 24/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "SettingsViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "AudioManager.h"
#import "currentUser.h"
#import "User.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *musicButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property AVAudioPlayer *audioPlayer;
@end

@implementation SettingsViewController

- (IBAction)toggleMusic:(id)sender {
    //[s]
    [[[currentUser sharedManager] user] changeMusicStatus];
    [[currentUser sharedManager] saveConfiguration];
    [[AudioManager sharedManager] toggle];
    if([[[AudioManager sharedManager] player] isPlaying]){
        [sender setBackgroundImage:[UIImage imageNamed:@"music on"] forState:UIControlStateNormal];
        //[[currentUser sharedManager]user]
    }
    else{
        [sender setBackgroundImage:[UIImage imageNamed:@"music off"] forState:UIControlStateNormal];
    }
    

    
}

- (IBAction)toggleSound:(UIButton *)sender {
    
}
- (IBAction)resetDefault:(id)sender {
    [[[currentUser sharedManager] user] initWithUserId:[NSNumber numberWithInt:1]];
    [[currentUser sharedManager] saveConfiguration];
    if([[[currentUser sharedManager] user] isMusicOn]){
        [self.musicButton setBackgroundImage:[UIImage imageNamed:@"music on"] forState:UIControlStateNormal];
    }
    else{
        [self.musicButton setBackgroundImage:[UIImage imageNamed:@"music off"] forState:UIControlStateNormal];
    }

}

- (void)viewDidLoad {
    [super viewDidLoad];
    if([[[currentUser sharedManager] user] isMusicOn]){
        [self.musicButton setBackgroundImage:[UIImage imageNamed:@"music on"] forState:UIControlStateNormal];
    }
    else{
        [self.musicButton setBackgroundImage:[UIImage imageNamed:@"music off"] forState:UIControlStateNormal];
    }

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
