//
//  RecordViewController.m
//  CintinWork
//
//  Created by din1030 on 2016/1/6.
//  Copyright © 2016年 Cheng Chia Ting. All rights reserved.
//

#import "RecordViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "UIImageView+Rotate.h"

@interface RecordViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *recordImg;
@property (strong, nonatomic) IBOutlet UIImageView *stylus;
@property (strong, nonatomic) IBOutlet UIButton *playBtn;
@property (strong, nonatomic) IBOutlet UIButton *pauseBtn;
@property BOOL isPlaying;
- (IBAction)clickPlayBtn:(UIButton *)sender;
- (IBAction)clickPauseBtn:(id)sender;
@property AVAudioPlayer *fullTrackPlayer;
@property (strong, nonatomic) IBOutlet UIImageView *bgImg;
@property (strong, nonatomic) IBOutlet UIImageView *textImg;

@end

@implementation RecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _isPlaying = YES;
    
    NSArray *tracks = @[@"Track0", @"Track1", @"Track2", @"Track3", @"Track4", @"Track5", @"Track6", @"Track7", @"Track8"];
    NSArray *lastCharIDs = @[@1, @72, @82, @91, @101, @52, @62, @92, @102];
    NSInteger i = ([CintinGlobalData sharedInstance].lastCharID.intValue > 0) ? [lastCharIDs indexOfObject:[CintinGlobalData sharedInstance].lastCharID] : 1;
    NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                    [UIImage imageNamed:[NSString stringWithFormat:@"bg_track%ld_1.jpg", (long)i]],
                                    [UIImage imageNamed:[NSString stringWithFormat:@"bg_track%ld_2.jpg", (long)i]],nil];
    
    [_bgImg setAnimationImages: animationImg];
    [_bgImg setAnimationDuration: 1.0];
    [_bgImg startAnimating];

    NSString *path = [[NSBundle mainBundle] pathForResource:tracks[i] ofType:@"wav"];
    _fullTrackPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    _fullTrackPlayer.volume = 0.8;
    _fullTrackPlayer.numberOfLoops = -1;
    [_fullTrackPlayer prepareToPlay];
    
    [_recordImg rotate360WithDuration:3.0f repeatCount:0];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
    [UIView animateWithDuration:2.0
                          delay:5.0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         _textImg.alpha = 0;
                     }
                     completion:nil];
    [_fullTrackPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickPlayBtn:(UIButton *)sender {
    
    if (_isPlaying) return;
    
    _stylus.image =[UIImage imageNamed:@"stylus_play.png"];
    
    NSArray *lastCharIDs = @[@1, @72, @82, @91, @101, @52, @62, @92, @102];
    NSInteger i = ([CintinGlobalData sharedInstance].lastCharID.intValue > 0) ? [lastCharIDs indexOfObject:[CintinGlobalData sharedInstance].lastCharID] : 1;
    NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                    [UIImage imageNamed:[NSString stringWithFormat:@"bg_track%ld_1.jpg", (long)i]],
                                    [UIImage imageNamed:[NSString stringWithFormat:@"bg_track%ld_2.jpg", (long)i]],nil];
    
    [_bgImg setAnimationImages: animationImg];
    [_bgImg setAnimationDuration: 1.0];
    [_bgImg startAnimating];
    
    [_recordImg resumeAnimations];
    _isPlaying = YES;
    [_fullTrackPlayer play];
    _pauseBtn.hidden = NO;
    
}

- (IBAction)clickPauseBtn:(UIButton *)sender {
    
    if (!_isPlaying) return;
    
    _bgImg.animationImages = nil;
    _bgImg.image = [UIImage imageNamed:@"8-2_bg.jpg"];
    _stylus.image =[UIImage imageNamed:@"stylus_pause.png"];
    [_recordImg pauseAnimations];
    _isPlaying = NO;
    [_fullTrackPlayer pause];
    _pauseBtn.hidden = YES;
}

@end
