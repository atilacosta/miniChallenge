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

        self.frame = CGRectMake([_itemPosX intValue], [_itemPosY intValue], 100, 100);
        // action
        
//        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:_itemName]]];
        [self setBackgroundColor:[UIColor blueColor]];
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
