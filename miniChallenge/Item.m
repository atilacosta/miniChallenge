//
//  Item.m
//  miniChallenge
//
//  Created by Henrique Jordão on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Item.h"
#import "Subject.h"

@interface Item ()

@property NSMutableArray *privateSubjects;

@end

@implementation Item


- (instancetype)initWithData:(NSDictionary *)data{
    self = [super init];
    if (self) {
        _privateSubjects = [NSMutableArray new];
        
        _itemName = data[@"itemName"];
        _itemPosX = data[@"itemPosX"];
        _itemPosY = data[@"itemPosY"];
        //_itemSubjects = data[@"subsjectsList"];
        
//        self.frame.origin.x = _itemPosX;
//        self.frame.origin.y = _itemPosY;

        
 
        
        UIImage *image = [UIImage imageNamed:_itemName];
        
        CGFloat heightInPoints = image.size.height;
        //CGFloat heightInPixels = heightInPoints * image.scale;
        
        CGFloat widthInPoints = image.size.width;
        //CGFloat widthInPixels = widthInPoints * image.scale;
        
        self.frame = CGRectMake([_itemPosX intValue], [_itemPosY intValue], widthInPoints, heightInPoints);
        
        [self setBackgroundColor:[UIColor colorWithPatternImage:image]];
        
        //action
        
        for(NSDictionary *currentSubject in data[@"itemsSubjects"]){
            [self.privateSubjects addObject:[[Subject alloc] initWithData:currentSubject]];
        }
        
    }
    return self;
}

-(NSArray *)itemsSubjects {
    return [_privateSubjects copy];
}

//Add função para retornar a string do nome do objeto.


@end
