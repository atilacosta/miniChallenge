//
//  Question.m
//  miniChallenge
//
//  Created by Renan Magagnin on 4/20/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Question.h"

// Static variable
int uniqueIDReference = -1;

@implementation Question

- (instancetype)initWithDictionary: (NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _uniqueID = [Question getUniqueID];
        
        _question = dict[@"question"];
        // enum
        _value = [dict[@"questionValue"] intValue];
        
        _hint = dict[@"questionHint"];
        _choices = dict[@"questionChoices"];
        
    }
    return self;
}


-(BOOL)gradeQuestionWithAlternative: (NSString *)alternative {
    if([alternative isEqualToString: [self.choices objectAtIndex:0]]){
        return YES;
    }else {
        return NO;
    }
}


+(NSNumber *)getUniqueID {
    uniqueIDReference += 1;
    return @(uniqueIDReference);
}

@end
