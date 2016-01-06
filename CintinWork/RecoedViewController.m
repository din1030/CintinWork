//
//  RecoedViewController.m
//  CintinWork
//
//  Created by din1030 on 2016/1/6.
//  Copyright © 2016年 Cheng Chia Ting. All rights reserved.
//

#import "RecoedViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface RecoedViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *recordImg;
@property (strong, nonatomic) IBOutlet UIImageView *stylus;
- (IBAction)clickPlayBtn:(UIButton *)sender;
- (IBAction)clickPauseBtn:(id)sender;
@property BOOL stopAnimation;

@end

@implementation RecoedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)clickPlayBtn:(UIButton *)sender {
    _stylus.image =[UIImage imageNamed:@"stylus_play.png"];
    [UIView animateWithDuration:2
                          delay:0
                        options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionRepeat
                     animations:^{
                         _recordImg.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished) {
//                         [UIView animateWithDuration:2
//                                               delay:0
//                                             options:UIViewAnimationOptionCurveLinear
//                                          animations:^{
//                                              _recordImg.transform = CGAffineTransformIdentity;
//                                          }
//                                          completion:nil];
                     }];
}

- (IBAction)clickPauseBtn:(id)sender {
    _stylus.image =[UIImage imageNamed:@"stylus_pause.png"];
    [_recordImg.layer removeAllAnimations];
}
@end
