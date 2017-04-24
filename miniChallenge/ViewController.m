//
//  ViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *titleImage;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *configButton;
@property (weak, nonatomic) IBOutlet UIButton *leaderButton;
@property (weak, nonatomic) IBOutlet UIButton *facebookButton;
@property AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (IBAction)startGame:(UIButton *)sender {
}
- (IBAction)toggleMusic:(id)sender {
    if(_audioPlayer.isPlaying){
        [_audioPlayer stop];
    }
    else{
        [_audioPlayer play];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"test"  ofType:@"mp3"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    _audioPlayer.numberOfLoops = -1;
    [_audioPlayer play];
    // Do any additional setup after loading the view, typically from a nib.
    //veeejjaaaaa
    //adicionar no git
    //Passos:
    //0 - sempre dar um git pull antes de commitar
    //1 - va para a pasta do projeto via terminal
    //2 - git add .
    //3 - git commit -m "digite a mensagem que representa a mudanca"
    //4 - git push
    
    //renon esteve aqui
    //mestre esteve aqui
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
