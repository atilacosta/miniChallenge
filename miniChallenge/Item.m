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
        
        UIImage *image = [UIImage imageNamed:_itemName];
        CGFloat heightInPoints = image.size.height;
        CGFloat widthInPoints = image.size.width;
        
        self.frame = CGRectMake([_itemPosX intValue], [_itemPosY intValue], widthInPoints, heightInPoints);
        
//        [self setBackgroundColor:[UIColor colorWithPatternImage:image]];
        [self setBackgroundImage:image forState:UIControlStateNormal];
        
        for(NSDictionary *currentSubject in data[@"subjectsList"]){
            [_itemSubjects addObject:[[Subject alloc] initWithData:currentSubject]];
        }
        
    }
    return self;
}


-(void)setPositionX:(NSNumber *)x andY:(NSNumber *)y{
    
    NSLog(@"%@    %@", self.itemPosX, self.itemPosY);
    
    self.itemPosX = @(([self.itemPosX intValue] * [x intValue])/1024);
    self.itemPosY = @(([self.itemPosY intValue] * [y intValue])/748);
    
    NSLog(@"%@    %@", self.itemPosX, self.itemPosY);
    
}

- (NSArray *)updateImageWidth:(CGFloat)width andHeight:(CGFloat)height andX:(NSNumber *)x andY:(NSNumber *)y{
    
    NSMutableArray *new = [NSMutableArray new];
    
    NSNumber *newWidth = @((width * [x intValue])/1024);
    NSNumber *newHeight = @((height * [y intValue])/748);
    
    [new addObject:newWidth];
    [new addObject:newHeight];
    
    return new;
}

//Add função para retornar a string do nome do objeto.


@end
