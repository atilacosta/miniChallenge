//
//  User.m
//  miniChallenge
//
//  Created by Günter Hertz on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "User.h"
#import "AudioManager.h"


@interface User()

@property NSNumber *currentCharacters;
@property NSMutableSet<NSNumber *> *currentQuestionsIds;
@property (nonatomic)NSMutableDictionary *currentSettings;
@property (nonatomic) int currentHits;


@end


@implementation User

- (instancetype)initWithUserId:(NSNumber *)userId
{
    self = [super init];
    if (self) {
        _userId = userId;
        _playerPoints = [[NSNumber alloc]initWithInt:0];
        _numberOfCharacters = [[NSNumber alloc]initWithInt:1];
        _numberOfHits = [[NSNumber alloc]initWithInt:0];
        _answeredQuestionsIds = [[NSMutableSet alloc]init];
        _userSettings = [[NSDictionary alloc]init];
        _userSettings = @{
                          @"SOUND":@"YES",
                          @"MUSIC":@"YES",
                          @"LANGUAGE": @"PT_BR"
                          };
        //inicializando as variaveis privadas
        _currentCharacters = [[NSNumber alloc]init];
        _currentCharacters = _numberOfCharacters;
        _currentQuestionsIds = [[NSMutableSet alloc]initWithSet:_answeredQuestionsIds];
        _currentSettings = [[NSMutableDictionary alloc]initWithDictionary:_userSettings];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (self != nil) {
        _userId = [decoder decodeObjectForKey:@"ID"];
        _playerPoints = [decoder decodeObjectForKey:@"POINTS"];
        _numberOfCharacters = [decoder decodeObjectForKey:@"NUMBEROFCHARACTER"];
        _numberOfHits = [decoder decodeObjectForKey:@"NUMBEROFHITS"];
        _answeredQuestionsIds = [decoder decodeObjectForKey:@"ANSWEREDQUESTIONS"];
        _userSettings = [decoder decodeObjectForKey:@"SETTINGS"];
        
        
        //inicializando as variaveis privadas
        _currentQuestionsIds = [[NSMutableSet alloc]initWithSet:_answeredQuestionsIds];
        _currentCharacters = [[NSNumber alloc]init];
        _currentCharacters = _numberOfCharacters;

        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userId forKey: @"ID"];
    [encoder encodeObject:self.playerPoints forKey:@"POINTS"];
    [encoder encodeObject:self.numberOfCharacters forKey:@"NUMBEROFCHARACTER"];
    [encoder encodeObject:self.numberOfHits forKey:@"NUMBEROFHITS"];
    [encoder encodeObject:self.answeredQuestionsIds forKey:@"ANSWEREDQUESTIONS"];
    [encoder encodeObject:self.userSettings forKey:@"SETTINGS"];
    
}


- (void)insertAnsweredQuestionsId:(NSNumber *)questionId{
    if(![_currentQuestionsIds containsObject:questionId]){
        [_currentQuestionsIds addObject:questionId];
        _answeredQuestionsIds = [[[NSSet alloc]initWithSet:_currentQuestionsIds]copy];
        _currentHits += [_numberOfHits intValue];
        _numberOfHits = [NSNumber numberWithInt:_currentHits];
    }
}

- (void)changeMusicStatus{
    if([[self.currentSettings valueForKey:@"MUSIC"] isEqualToString:@"YES"]){
        [self.currentSettings setValue:@"NO" forKey:@"MUSIC"];
    }else{
        [self.currentSettings setValue:@"YES" forKey:@"MUSIC"];
        [[AudioManager sharedManager]playMusic];
    }
    _userSettings = [[[NSDictionary alloc]initWithDictionary:self.currentSettings]copy];
    
}

-(void)changeSoundStatus{
    if([[self.currentSettings valueForKey:@"SOUND"] isEqualToString:@"YES"]){
        [self.currentSettings setValue:@"NO" forKey:@"SOUND"];
    }else{
        [self.currentSettings setValue:@"YES" forKey:@"SOUND"];
        
    }
    _userSettings = [[[NSDictionary alloc]initWithDictionary:self.currentSettings]copy];
    
}

-(void)addCharacter{
    int characters = [_currentCharacters intValue] + 1;
    _numberOfCharacters = [[NSNumber alloc]initWithInt:characters];
    _currentCharacters = _numberOfCharacters;
}

-(BOOL)isMusicOn{
    if([[self.userSettings valueForKey:@"MUSIC"] isEqualToString:@"YES"]){
        return YES;
    }else{
        return NO;
    }
}

-(BOOL)isSoundOn{
    if([[self.userSettings valueForKey:@"SOUND"] isEqualToString:@"YES"]){
        return YES;
    }else{
        return NO;
    }
}


@end
