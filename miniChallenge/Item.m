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

@interface Item ()

@property NSMutableArray *privateSubjects;

@end

@implementation Item


- (instancetype)initWithData:(NSDictionary *)data withWidth:(NSNumber *)width withHeight:(NSNumber *)height;{
    self = [super init];
    if (self) {
        _privateSubjects = [NSMutableArray new];
        
        _itemName = data[@"itemName"];
        _itemPosX = data[@"itemPosX"];
        _itemPosY = data[@"itemPosY"];

        
        [self setPositionX:width andY:height];
        
        UIImage *image = [UIImage imageNamed:_itemName];
        CGFloat heightInPoints = image.size.height;
        CGFloat widthInPoints = image.size.width;
        
        self.frame = CGRectMake([_itemPosX intValue], [_itemPosY intValue], widthInPoints, heightInPoints);
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:image]];

        
        for(NSDictionary *currentSubject in data[@"itemsSubjects"]){
            [self.privateSubjects addObject:[[Subject alloc] initWithData:currentSubject]];
        }
        
    }
    return self;
}

-(NSArray *)itemsSubjects {
    return [_privateSubjects copy];
}


-(void)setPositionX:(NSNumber *)x andY:(NSNumber *)y{
    
    NSLog(@"%@    %@", self.itemPosX, self.itemPosY);
    
    self.itemPosX = @(([self.itemPosX intValue] * [x intValue])/1024);
    self.itemPosY = @(([self.itemPosY intValue] * [y intValue])/748);
    
}


@end
