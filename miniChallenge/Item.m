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
        
        //NSLog(@"%@ %@", width, height);
        
        self.frame = CGRectMake([_itemPosX intValue], [_itemPosY intValue], widthInPoints/[self getItemRatioWithSize:width andWidthFlag:YES], heightInPoints/[self getItemRatioWithSize:height andWidthFlag:NO]);
        
        //NSLog(@"%@", self.itemName);
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

- (double)getItemRatioWithSize:(NSNumber *)size andWidthFlag:(BOOL)isWidth{
    double newRatio = 0.0;
    
    if ([self.itemName isEqualToString:@"Sun"]) {
        if(isWidth == 1){
            newRatio = (736 * 0.8)/[size intValue];
        } else{
            newRatio = (414 * 0.8)/[size intValue];
        }
    } else if ([self.itemName isEqualToString:@"Earth"]) {
        if(isWidth == 1){
            newRatio = (736 * 1.6)/[size intValue];
        } else{
            newRatio = (414 * 1.6)/[size intValue];
        }
    } else if ([self.itemName isEqualToString:@"Comet"]) {
        if(isWidth == 1){
            newRatio = (736 * 2.1)/[size intValue];
        } else{
            newRatio = (414 * 2.1)/[size intValue];
        }
    } else if ([self.itemName isEqualToString:@"Satellite"]) {
        if(isWidth == 1){
            newRatio = (736 * 2.0)/[size intValue];
        } else{
            newRatio = (414 * 2.0)/[size intValue];
        }
    } else if ([self.itemName isEqualToString:@"Spaceship"]) {
        if(isWidth == 1){
            newRatio = (736 * 2.6)/[size intValue];
        } else{
            newRatio = (414 * 2.6)/[size intValue];
        }
    } else {
        if(isWidth == 1){
            newRatio = (736 * 2.0)/[size intValue];
        } else{
            newRatio = (414 * 2.0)/[size intValue];
        }
    }
    
    return newRatio;
    
}

//- (float)updateRatio:(float)ratio andNewSize:(NSNumber *)size withWidthFlag:(BOOL)isWidth{
//    
//    float newRatio = 0.0;
//    
//    if(isWidth == 1){
//       newRatio = ([size intValue] * ratio)/736;
//    } else{
//       newRatio = ([size intValue] * ratio)/414;
//    }
//    
//    return newRatio;
//    
//}

@end
