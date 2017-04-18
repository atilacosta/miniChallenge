//
//  CharacterViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "CharacterViewController.h"

@interface CharacterViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *characterSelect;

@end

@implementation CharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.characterSelect.pagingEnabled = YES;
    _characterSelect.alwaysBounceVertical = NO;
    _characterSelect.bounces = NO;
    UIImageView *imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Third View 1.jpg"]];
    
    [_characterSelect addSubview:imageView2];
    
    UIImageView *image = [[UIImageView alloc] initWithFrame:
                          CGRectMake(imageView2.frame.size.width, 0,
                                     imageView2.frame.size.width,
                                     imageView2.frame.size.height)];
    image.image = [UIImage imageNamed:[NSString stringWithFormat:@"Third View 1.jpg"]];
                                       
    [_characterSelect addSubview:image];
    _characterSelect.contentSize = CGSizeMake(2 * imageView2.image.size.width, imageView2.image.size.height);
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
