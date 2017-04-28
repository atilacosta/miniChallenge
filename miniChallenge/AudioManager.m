//
//  AudioManager.m
//  miniChallenge
//
//  Created by Atila Costa on 24/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "AudioManager.h"
#import <AVFoundation/AVFoundation.h>

@implementation AudioManager

@synthesize player;

#pragma mark Singleton Methods

+ (AudioManager *)sharedManager {
    static AudioManager *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[self alloc] init];
    }
    return sharedMyManager;
}

- (AudioManager *)init {
    if (self = [super init]) {
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"test"  ofType:@"mp3"];
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        player.numberOfLoops = -1;
    
    }
    return self;
}

- (void)toggle{
    if(player.isPlaying){
        [player stop];
    }
    else{
        [player play];
    }
}

- (void)playMusic{
    [player play];
}

- (void)stopMusic{
    [player stop];
}

- (void)dealloc {
    // Should never be called, but just here for clarity really.
}

@end
