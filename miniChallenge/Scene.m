//
//  Scene.m
//  miniChallenge
//
//  Created by Renan Magagnin on 4/19/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Scene.h"
#import "Item.h"

// Static reference counters for the scene itself and the items that belong to it.
int uniqueIDReference;
int ItemUniqueIDReference;

@interface Scene ()

@property NSMutableArray *privateItemsList;

@end


@implementation Scene

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithDictionary: (NSDictionary *)dict
{
    self = [super init];
    if (self) {
        //_uniqueID;
        _privateItemsList = [NSMutableArray new];
        
        _name = dict[@"sceneName"];
        _backgroundImage = dict[@"sceneImage"];
        
        for (NSDictionary *currentDict in dict[@"itemsList"]){
            Item *currentItem = [[Item alloc] initWithData:currentDict];
            [_privateItemsList addObject:currentItem];
            
            [self addSubview:currentItem];
            
            // set position from plist info
            // add subview
        }
        
    }
    return self;
}

// Overrides the itemList property getter
-(NSArray *)itemsList {
    return [_privateItemsList copy];
}


// Method for a scene to get its unique ID
+ (NSNumber *)getUniqueID {
    uniqueIDReference++;
    return @(uniqueIDReference-1);
}

// Method for an item that belongs to the scene to get its unique ID
+ (NSNumber *)getItemUniqueID {
    ItemUniqueIDReference++;
    return @(ItemUniqueIDReference-1);
}

@end
