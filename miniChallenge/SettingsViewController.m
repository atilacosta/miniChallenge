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

@interface SettingsViewController ()
@property AVAudioPlayer *audioPlayer;
@end

@implementation SettingsViewController

- (IBAction)toggleMusic:(id)sender {
    //[s]
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

- (void)viewDidLoad {
    [super viewDidLoad];

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
