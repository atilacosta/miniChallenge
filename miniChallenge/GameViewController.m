//
//  GameViewController.m
//  miniChallenge
//
//  Created by Atila Costa on 17/04/17.
//  Copyright © 2017 Atila Costa. All rights reserved.
//

#import "GameViewController.h"
#import "Scene.h"
#import "Item.h"

@interface GameViewController ()


@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.selectedScene = [[Scene alloc] initWithDictionary:self.selectedSceneDictionary];
    self.selectedScene.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.selectedScene];
    
//    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Space"]]];
//    [self.view setBackgroundColor:[UIColor redColor]];
    
    
    
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
