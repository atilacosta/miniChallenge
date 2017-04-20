//
//  Question.m
//  miniChallenge
//
//  Created by Renan Magagnin on 4/20/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Question.h"

@implementation Question

- (instancetype)initWithDictionary: (NSDictionary *)dict
{
    self = [super init];
    if (self) {
//        _uniqueID;
        _question = dict[@"question"];
        // enum
        
        _hint = dict[@"questionHint"];
        _choices = dict[@"questionChoices"];
        
    }
    return self;
}


@end
