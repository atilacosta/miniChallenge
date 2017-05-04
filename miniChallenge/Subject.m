//
//  Subject.m
//  miniChallenge
//
//  Created by Henrique Jordão on 20/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Subject.h"
#import "Question.h"
#import "currentUser.h"
#import "User.h"

@implementation Subject

- (instancetype)initWithData: (NSDictionary *)data
{
    self = [super init];
    if (self) {
        
        _questionsList = [NSMutableArray new];
        
        _subjectName = data[@"subjectName"];

        //NSLog(@"DICT QUESTIONS = %@",data);
        
        
        
        for(NSDictionary *currentQuestion in data[@"questionsList"]){
            [self.questionsList addObject:[[Question alloc]initWithDictionary:currentQuestion]];
            NSLog(@"%@", currentQuestion);
        
        }
    
    }
    return self;
}

-(Question *)getRandomUnansweredQuestion {
    int randomIndex;
    
    do{
        randomIndex = arc4random_uniform((int)[self.questionsList count]);
    }while([[currentUser sharedManager].user.answeredQuestionsIds containsObject:[self.questionsList objectAtIndex:randomIndex].uniqueID]); // Replace this with: "while the result gave me a already answered question"
    return [self.questionsList objectAtIndex:randomIndex];
}

-(BOOL)hasQuestionsAvaiable{
    for(Question *current in self.questionsList){
        if(!([[[currentUser sharedManager] user].answeredQuestionsIds containsObject:current.uniqueID])){
            return YES;
        }
    }
    return NO;
}

@end
