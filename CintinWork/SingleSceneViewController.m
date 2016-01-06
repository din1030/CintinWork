//
//  SingleSceneViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/29.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "SingleSceneViewController.h"

@interface SingleSceneViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *bgAnimation;

@end

@implementation SingleSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"RID: %@", self.restorationIdentifier);

    if ([self.restorationIdentifier isEqualToString:@"home"]) {
        // 動畫
        NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                        [UIImage imageNamed:@"cover_1.jpg"],
                                        [UIImage imageNamed:@"cover_2.jpg"],
                                        [UIImage imageNamed:@"cover_3.jpg"],nil];
        
        [self.bgAnimation setAnimationImages: animationImg];
        [self.bgAnimation setAnimationDuration: 1.0];
        [self.bgAnimation startAnimating];
        
        [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1f, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
        
    } else if ([self.restorationIdentifier isEqualToString:@"b4Cafe"]) {
        
        [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1f, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
        
    } else if ([self.restorationIdentifier isEqualToString:@"homeScene"]) {
        
        // 動畫
        NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                        [UIImage imageNamed:@"7-1.png"],
                                        [UIImage imageNamed:@"7-1_2.png"],nil];
        
        [self.bgAnimation setAnimationImages: animationImg];
        [self.bgAnimation setAnimationDuration: 1.0];
        [self.bgAnimation startAnimating];
        
        [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.2f, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
        
    }
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
