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
    
    if ([self.restorationIdentifier isEqualToString:@"home"]) {
        
        // 動畫
        NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                        [UIImage imageNamed:@"cover_1.jpg"],
                                        [UIImage imageNamed:@"cover_2.jpg"],
                                        [UIImage imageNamed:@"cover_3.jpg"],nil];
        
        [self.bgAnimation setAnimationImages: animationImg];
        [self.bgAnimation setAnimationDuration: 1.0];
        [self.bgAnimation startAnimating];
        
        [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.2f];
        
//    } else if ([self.restorationIdentifier isEqualToString:@"howToPlay"]) {
        
//        [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.2f];
        
    } else if ([self.restorationIdentifier isEqualToString:@"b4Cafe"]) {
        
        [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.8f];
        
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
