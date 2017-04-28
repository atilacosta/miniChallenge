//
//  AudioManager.h
//  miniChallenge
//
//  Created by Atila Costa on 24/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioManager : NSObject {
    AVAudioPlayer *player;
}

@property (nonatomic, retain) AVAudioPlayer *player;

- (void)toggle;
+ (AudioManager *)sharedManager;

- (void)playMusic;
- (void)stopMusic;

@end
