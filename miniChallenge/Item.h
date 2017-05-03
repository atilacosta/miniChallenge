//
//  Item.h
//  miniChallenge
//
//  Created by Henrique Jordão on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//


#import <UIKit/UIKit.h>

@class Subject;

@interface Item : UIButton

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic) NSMutableArray<Subject *>  *itemSubjects;
@property (nonatomic) NSNumber *itemPosX;
@property (nonatomic) NSNumber *itemPosY;


- (instancetype)initWithData:(NSDictionary *)data withWidth:(NSNumber *)width withHeight:(NSNumber *)height;;

-(Subject *)subjectByName: (NSString *)name;
- (BOOL)hasQuestionsRemainingForAllSubjects;

@end
