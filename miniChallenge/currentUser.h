//
//  AudioManager.h
//  miniChallenge
//
//  Created by Atila Costa on 24/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface currentUser : NSObject {
    User *user;
}

@property (nonatomic, retain) User *user;
+ (currentUser *)sharedManager;

- (void)saveConfiguration;

@end
