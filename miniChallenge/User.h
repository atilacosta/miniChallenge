//
//  User.h
//  miniChallenge
//
//  Created by Günter Hertz on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property (nonatomic, readonly)NSNumber *userId;
@property (nonatomic)NSNumber *playerPoints;
@property (nonatomic, readonly)NSNumber *numberOfHits;
@property (nonatomic, readonly)NSNumber *numberOfCharacters;
@property (nonatomic, readonly, copy)NSSet *answeredQuestionsIds;
@property (nonatomic, readonly, copy)NSDictionary *userSettings;


- (instancetype)initWithUserId:(NSNumber *)userId;

- (id)initWithCoder:(NSCoder *)decoder;

- (void)insertAnsweredQuestionsId:(NSNumber *)questionId;

- (void)changeSoundStatus;

- (void)changeMusicStatus;

- (void)addCharacter;

- (BOOL)isSoundOn;

- (BOOL)isMusicOn;



@end
