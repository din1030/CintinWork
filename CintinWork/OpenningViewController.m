//
//  OpenningViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "OpenningViewController.h"
#import "CintinGlobalData.h"

@interface OpenningViewController ()

@property NSArray *AnimationImg, *AnimationImg2;
@property BOOL repeat;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation OpenningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _AnimationImg = @[[UIImage imageNamed:@"1-1.png"], [UIImage imageNamed:@"1-2.png"], [UIImage imageNamed:@"1-3.png"], [UIImage imageNamed:@"1-4.png"]];
    _repeat = YES;
    _AnimationImg2 = @[[UIImage imageNamed:@"b1-1.png"], [UIImage imageNamed:@"b1-2.png"], [UIImage imageNamed:@"b1-3.png"], [UIImage imageNamed:@"b1-4.png"]];
    //    _imageView.image = _AnimationImg[0];
//    [CintinGlobalData sharedInstance];
}

- (void)viewDidAppear:(BOOL)animated {
    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].BGM setVolume:0.5f];
    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.2f];
//    [CintinGlobalData.sharedInstance.BGM play];
//    [CintinGlobalData.sharedInstance.trackA setVolume:0.2f];
//    [CintinGlobalData.sharedInstance.trackA play];

    [self fadeInOutImage:_AnimationImg index:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fadeInOutImage:(NSArray<UIImage *> *)imageArr index:(int)i {
    _imageView.frame = (CGRect){0, 0, 1024, 768};
    // 靜止時間
    sleep(2);
    [UIView transitionWithView:_imageView
                      duration:2.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _imageView.image = imageArr[i];
                    }
                    completion:^(BOOL finished){
//                        [self performSegueWithIdentifier:@"to_1_5" sender:self];
//                        return;
//#warning shortcut to 1-5
                        // 還有下一張圖
                        if (i < [imageArr count] - 1) {
                            [self fadeInOutImage:imageArr index:(i+1)];
                        } else if (i == [imageArr count] - 1){
                            [self rollLongImageView];
                        }
                        
                    }];
}

- (void)rollLongImageView {
    
    _imageView.frame = (CGRect){0, -1536, 1024, 2304};
    _imageView.image = (_repeat) ? [UIImage imageNamed:@"1-4-long.png"] : [UIImage imageNamed:@"b1-4-long.png"];
    
    [UIView transitionWithView:_imageView
                      duration:9.0f
                       options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [_imageView setFrame:(CGRect){0, 0, 1024, 2304}];
                     }
                     completion:^(BOOL finished){
                         if (_repeat) {
                             [self fadeInOutImage:_AnimationImg2 index:1];
                             _repeat = NO;
                         } else {
                             sleep(2);
                             [self performSegueWithIdentifier:@"to_1_5" sender:self];
                         }
                     }];
    
}

@end
