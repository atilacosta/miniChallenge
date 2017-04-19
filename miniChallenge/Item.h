//
//  Item.h
//  miniChallenge
//
//  Created by Henrique Jordão on 19/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface Item : UIImageView

@property (nonatomic,copy) NSNumber *itemID;
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic,readonly) NSString *itemPhoto;
@property (nonatomic) NSSet *itemTags;
@property (nonatomic) NSSet *itemQuestions;
@property (nonatomic) NSNumber *itemPosX;
@property (nonatomic) NSNumber *itemPosY;

//Oie

//Hello

@end
