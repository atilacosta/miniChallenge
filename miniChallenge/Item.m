//
//  Item.m
//  miniChallenge
//
//  Created by Henrique Jordão on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Item.h"
#import "Subject.h"
#import "GameViewController.h"


@implementation Item


- (instancetype)initWithData:(NSDictionary *)data withWidth:(NSNumber *)width withHeight:(NSNumber *)height;{
    self = [super init];
    if (self) {
        _itemSubjects = [NSMutableArray new];
        
        _itemName = data[@"itemName"];
        _itemPosX = data[@"itemPosX"];
        _itemPosY = data[@"itemPosY"];
        
        [self setPositionX:width andY:height];
        
        UIImage *image = [UIImage new];
        
        
        for(NSDictionary *currentSubject in data[@"subjectsList"]){
            //NSLog(@"%@",currentSubject);
            [self.itemSubjects addObject:[[Subject alloc] initWithData:currentSubject]];
        }
        
        if([self hasQuestionsRemainingForAllSubjects]){
            image = [UIImage imageNamed:[NSString stringWithFormat:@"highlight%@",_itemName]];
        } else{
            image = [UIImage imageNamed:_itemName];
            [self setEnabled:NO];
        }
        
        CGFloat heightInPoints = image.size.height;
        CGFloat widthInPoints = image.size.width;
        
        self.frame = CGRectMake([_itemPosX intValue], [_itemPosY intValue], widthInPoints/1.7, heightInPoints/1.7);
        
        //        [self setBackgroundColor:[UIColor colorWithPatternImage:image]];
        [self setBackgroundImage:image forState:UIControlStateNormal];
    }
    return self;
}


-(void)setPositionX:(NSNumber *)x andY:(NSNumber *)y{
    
    //NSLog(@"%@    %@", self.itemPosX, self.itemPosY);
    
    self.itemPosX = @(([self.itemPosX intValue] * [x intValue])/1024);
    self.itemPosY = @(([self.itemPosY intValue] * [y intValue])/748);
    
}

-(Subject *)subjectByName: (NSString *)name {
    for (Subject *current in self.itemSubjects){
        if(current.subjectName == name){
            return current;
        }
    }
    return nil; // Subject not found
}

- (BOOL)hasQuestionsRemainingForAllSubjects{
    
    for(Subject *current in self.itemSubjects){
        if([current hasQuestionsAvaiable]){
            return YES;
        }
    }
    
    return NO;
}

@end
