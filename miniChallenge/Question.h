//
//  Question.h
//  miniChallenge
//
//  Created by Renan Magagnin on 4/20/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Subject;

@interface Question : NSObject

@property (nonatomic, readonly) NSNumber *uniqueID;
@property (nonatomic, weak) Subject *subject;
@property (nonatomic) NSString *question;
@property (nonatomic) int value;
@property (nonatomic) NSString *hint;

@property (nonatomic) NSArray<NSString *> *choices;

- (instancetype)initWithDictionary: (NSDictionary *)dict;

-(BOOL)gradeQuestionWithAlternative: (NSString *)alternative;

// Static method
+(NSNumber *)getUniqueID;
+(void)resetUniqueID;

@end
