//
//  Scene.m
//  miniChallenge
//
//  Created by Renan Magagnin on 4/19/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Scene.h"

// Static reference counters for the scene itself and the items that belong to it.
int uniqueIDReference;
int ItemUniqueIDReference;

@implementation Scene

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
        
        _itemsList = [[NSArray alloc] initWithContentsOfFile:filePath];
    }
    return self;
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
