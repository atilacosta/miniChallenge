//
//  Scene.m
//  miniChallenge
//
//  Created by Renan Magagnin on 4/19/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "Scene.h"
#import "Item.h"
#import "Subject.h"
//@interface Scene ()
//
//@property NSMutableArray *privateItemsList;
//
//@end


@implementation Scene

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithDictionary: (NSDictionary *)dict withWidth:(NSNumber *)width withHeight:(NSNumber *)height
{
//    self = [super init];
    self = [super initWithFrame:CGRectMake(0, 0, 2000, 2000)];
    if (self) {
        _itemsList = [NSMutableArray new];
        _name = dict[@"sceneName"];
        _backgroundImage = dict[@"sceneImage"];
        
        for (NSDictionary *currentDict in dict[@"itemsList"]){
            Item *currentItem = [[Item alloc] initWithData:currentDict withWidth:width withHeight:height];
            [_itemsList addObject:currentItem];
            
            [self addSubview:currentItem];
            
            // set position from plist info
            // add subview
        }
        for (Item *currentItem in _itemsList) {
            for (Subject *currentSub in currentItem.itemSubjects) {
                _TotalNumberOfQuestions += currentSub.questionsList.count;
            }
        }
    }
    return self;
}


// Overrides the itemList property getter
//-(NSArray *)itemsList {
//    return [_privateItemsList copy];
//}


@end
