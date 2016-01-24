//
//  One5ViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "One5ViewController.h"
#import "CintinGlobalData.h"

@interface One5ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *OLImg;
@property (strong, nonatomic) IBOutlet UIButton *back;
@property (strong, nonatomic) IBOutlet UIButton *next;
@property (strong, nonatomic) IBOutlet UIImageView *smoke1;
@property (strong, nonatomic) IBOutlet UIImageView *smoke2;
@property (strong, nonatomic) IBOutlet UIImageView *smoke3;

@end

@implementation One5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _back.hidden = YES;
    _next.hidden = YES;
    _OLImg.alpha = 0;
    
    [UIView animateWithDuration:7.0
                          delay:0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat
                     animations:^{
                         _smoke1.frame = (CGRect){-161, -91, _smoke1.frame.size.width, _smoke1.frame.size.height};
                     }
                     completion:nil];
    
    [UIView animateWithDuration:4.5
                          delay:0.5
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat
                     animations:^{
                         _smoke2.frame = (CGRect){505, -147, _smoke2.frame.size.width, _smoke2.frame.size.height};
                     }
                     completion:nil];
    
    [UIView animateWithDuration:5.0
                          delay:1.0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat
                     animations:^{
                         _smoke3.frame = (CGRect){540, 116, _smoke3.frame.size.width, _smoke3.frame.size.height};
                     }
                     completion:nil];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    // when back to 1-5, reset parkSceneState
    [CintinGlobalData sharedInstance].parkSceneState = initialState;
    
    [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@1.0, @0.05, @0.3, @0, @0, @0, @0, @0, @0, @0, @0]];
    [self doVolumeFade];
    
//    [CintinGlobalData.sharedInstance.BGM setVolume:0.3f];
    
    [UIView transitionWithView:_OLImg
                      duration:2.0f
                       options:UIViewAnimationOptionAutoreverse
                    animations:^{
                        _OLImg.alpha = 1.0f;
                    }
                    completion:^(BOOL finished){
                        
                        _OLImg.alpha = 0;
                        _OLImg.frame = (CGRect){456, 210, _OLImg.frame.size.width, _OLImg.frame.size.height};
                        
                        [UIView transitionWithView:_OLImg
                                          duration:1.0f
                                           options:0
                                        animations:^{
                                             _OLImg.alpha = 1.0f;
                                        }
                                        completion:^(BOOL finished){
                                            _back.hidden = NO;
                                            _next.hidden = NO;

                                        }];
                        
                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)doVolumeFade {
    if ([CintinGlobalData.sharedInstance.BGM isPlaying] && CintinGlobalData.sharedInstance.BGM.volume > 0.1f) {
        CintinGlobalData.sharedInstance.BGM.volume -= 0.025f;
        [self performSelector:@selector(doVolumeFade) withObject:nil afterDelay:0.25f];
    }
}

@end
