//
//  Item.h
//  miniChallenge
//
//  Created by Henrique Jordão on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface Item : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic,readonly) NSString *itemImageName;
@property (nonatomic) NSSet *itemQuestions;
@property (nonatomic) NSNumber *itemPosX;
@property (nonatomic) NSNumber *itemPosY;

//Oie

//Hello

//Lets go

@end
