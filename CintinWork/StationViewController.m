//
//  StationViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "StationViewController.h"

@interface StationViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *bgAnimation;
@property (strong, nonatomic) IBOutlet UIButton *OLBtn;

@end

@implementation StationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 動畫
    NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                    [UIImage imageNamed:@"3-1_bg1.png"],
                                    [UIImage imageNamed:@"3-1_bg2.png"],nil];

    [self.bgAnimation setAnimationImages: animationImg];
    [self.bgAnimation setAnimationDuration: 1.0];
    [self.bgAnimation startAnimating];
    _OLBtn.alpha = 0;

}

- (void)viewDidAppear:(BOOL)animated {
    
    [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0.1, @0.6, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
    
    [UIView transitionWithView:_OLBtn
                      duration:1.0f
                       options:0
                    animations:^{
                        _OLBtn.alpha = 1.0f;
                    }
                    completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"char_id"];
    }
}

@end
