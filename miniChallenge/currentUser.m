//
//  AudioManager.m
//  miniChallenge
//
//  Created by Atila Costa on 24/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "AudioManager.h"
#import "User.h"
#import "currentUser.h"

@implementation currentUser
@synthesize user;

#pragma mark Singleton Methods

+ (currentUser *)sharedManager {
    static currentUser *sharedMyManager = nil;
    @synchronized(self) {
        if (sharedMyManager == nil)
            sharedMyManager = [[currentUser alloc] init];
    }
    return sharedMyManager;
}

- (currentUser *)init {
    if (self = [super init]) {
        //retrieving Data
        NSUserDefaults *userConfigDefault = [NSUserDefaults standardUserDefaults];
        NSData *encodedUserConfig = [userConfigDefault objectForKey:@"encodedUser"];
        user = (User *)[NSKeyedUnarchiver unarchiveObjectWithData:encodedUserConfig];
        
        if(user != nil){
            user = [[User alloc]initWithUserId:[NSNumber numberWithInt:1]];
            
        }
    }
    return self;
}

- (void)saveConfiguration{
    NSData *encodedUserConfiguration = [NSKeyedArchiver archivedDataWithRootObject:self.user];
    NSUserDefaults *userConfigDefault = [NSUserDefaults standardUserDefaults];
    [userConfigDefault setObject:encodedUserConfiguration forKey:@"encodedUser"];
    [userConfigDefault synchronize];
    
}


@end
