//
//  CharCollectionViewCell.h
//  miniChallenge
//
//  Created by Atila Costa on 18/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE  @interface CharCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *charImage;
@property (nonatomic) NSDictionary *cellScene;
@end
