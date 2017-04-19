//
//  CharCollectionViewCell.m
//  miniChallenge
//
//  Created by Atila Costa on 18/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "CharCollectionViewCell.h"

@implementation CharCollectionViewCell

-(void)setCharacterForCell:(NSObject *)characterForCell{
    _characterForCell = characterForCell;
    //self.backgroundColor = [UIColor clearColor];
    _charImage.image = [UIImage imageNamed:@"personagem.png"];
    _charImage.contentMode = UIViewContentModeScaleAspectFill;
    
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.layer.cornerRadius = 3.0;
    self.layer.shadowRadius = 10;
    self.layer.shadowOpacity = 0.3;
    self.layer.shadowOffset = CGSizeMake(5, 10);
    self.clipsToBounds = FALSE;
    
}

@end
