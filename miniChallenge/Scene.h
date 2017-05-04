//
//  Scene.h
//  miniChallenge
//
//  Created by Renan Magagnin on 4/19/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface Scene : UIView

//@property (nonatomic, readonly) NSNumber *uniqueID;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *backgroundImage;
//@property (nonatomic) Character *character;
@property (nonatomic) NSInteger TotalNumberOfQuestions;
//@property (nonatomic) NSNumber *width,*height;

@property (nonatomic) NSMutableArray<Item *> *itemsList;

- (instancetype)initWithDictionary: (NSDictionary *)dict withWidth:(NSNumber *)width withHeight:(NSNumber *)height;

@end
