//
//  Subject.h
//  miniChallenge
//
//  Created by Henrique Jordão on 20/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Question;

@interface Subject : NSObject

@property (nonatomic) NSString *subjectName;
@property (nonatomic) NSMutableArray<Question *> *questionsList;


- (instancetype)initWithData: (NSDictionary *)data;


@end
