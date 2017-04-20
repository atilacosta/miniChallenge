//
//  Item.m
//  miniChallenge
//
//  Created by Henrique Jordão on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Item.h"

@interface Item ()

@property NSMutableArray *privateSubjects;

@end

@implementation Item


- (instancetype)initWithData:(NSDictionary *)data{
    self = [super init];
    if (self) {
        _privateSubjects = [NSMutableArray new];
        
        _itemName = data[@"itemName"];
        _itemImageName = data[@"itemImage"];
        _itemPosX = data[@"itemPosX"];
        _itemPosY = data[@"itemPosY"];
        //_itemSubjects = data[@"subsjectsList"];
        
        for(NSDictionary *currentSubject in data[@"itemsSubjects"]){
            //[self.privateSubjects addObject:<#(nonnull id)#>]
        }
        
    }
    return self;
}



+ (instancetype)itemWithData:(NSDictionary *)data{
    return [[Item alloc] initWithData:data];
}

//Add função para retornar a string do nome do objeto.


@end
