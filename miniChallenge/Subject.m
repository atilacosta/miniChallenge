//
//  Subject.m
//  miniChallenge
//
//  Created by Henrique Jordão on 20/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Subject.h"
#import "Question.h"


@implementation Subject

- (instancetype)initWithData: (NSDictionary *)data
{
    self = [super init];
    if (self) {
        //NSLog(@"IOIIEOEOEO");
        
        _questionsList = [NSMutableArray new];
        
        _subjectName = data[@"subjectName"];

        
        for(NSDictionary *currentQuestion in data[@"questionsList"]){
            [self.questionsList addObject:[[Question alloc]initWithDictionary:currentQuestion]];
        
        }
    
    }
    return self;
}

-(Question *)getRandomUnansweredQuestion {
    int randomIndex;
    do{
        randomIndex = arc4random_uniform((int)[self.questionsList count]);
    }while(2==3); // Replace this with: "while the result gave me a already answered question"
    return [self.questionsList objectAtIndex:randomIndex];
}

@end
