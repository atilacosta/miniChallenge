//
//  Scene.h
//  miniChallenge
//
//  Created by Renan Magagnin on 4/19/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Scene : UIView

//@property (nonatomic, readonly) NSNumber *uniqueIDReference;


@property (nonatomic, readonly) NSNumber *uniqueID;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *backgroundImage;

@property (nonatomic) NSArray *itemsList;


+(NSNumber *)getUniqueID;


- (instancetype)initWithDictionary: (NSDictionary *)dict;

@end
