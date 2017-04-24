//
//  Subject.m
//  miniChallenge
//
//  Created by Henrique Jordão on 20/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Subject.h"
#import "Question.h"

@interface Subject ()

@property NSMutableArray *privateQuestions;

@end

@implementation Subject

- (instancetype)initWithData: (NSDictionary *)data
{
    self = [super init];
    if (self) {
        _privateQuestions = [NSMutableArray new];
        
        _subjectName = data[@"subjectName"];
        
        for(NSDictionary *currentQuestion in data[@"questionsList"]){
            [self.privateQuestions addObject:[[Question alloc]initWithDictionary:currentQuestion]];
        }
    
    }
    return self;
}

-(NSArray *)itemsQuestions {
    return [_privateQuestions copy];
}

@end
