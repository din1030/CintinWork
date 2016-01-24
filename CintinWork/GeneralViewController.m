//
//  GeneralViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "GeneralViewController.h"

@interface GeneralViewController ()

- (IBAction)backHome:(UIButton *)sender;
- (IBAction)clickBack:(UIButton *)sender;
@property AVAudioPlayer *clickSoundPlayer;

@end

@implementation GeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [CintinGlobalData sharedInstance];
    _hintView.hidden = YES;
    for (UIView *subview in self.view.subviews) {
        if ([subview isKindOfClass:[UIButton class]]) {
            [(UIButton *)subview addTarget:self
                        action:@selector(playSound:)
              forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {

    switch (_prevCharID.intValue) {
        case 3: //cafe，場景編號 3
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 4: //flower
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 51: // flower
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0.5, @0, @0, @0, @0, @0]];
            break;
            
        case 52: // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0.5, @0, @0.5, @0, @0, @0]];
            break;
            
        case 61: // bushi
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0.6, @0, @0, @0, @0]];
            break;
            
        case 62: // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0.6, @0.5, @0, @0, @0]];
            break;
            
        case 71: //cafe
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0.7, @0, @0, @0]];
            break;
            
        case 72: // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0.5, @0, @0.5, @0, @0, @0]];
            break;
            
        case 81: // bushi
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0.5, @0, @0]];
            break;
            
        case 82:  // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0.5, @0, @0, @0.5, @0, @0]];
            break;
            
        case 91:  // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0.6, @0, @0, @0.4, @0]];
            break;
            
        case 92:  // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0.5, @0.4, @0]];
            break;
            
        case 101:  // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0.6, @0, @0, @0,  @0.4]];
            break;
            
        case 102:  // home
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0.5, @0,  @0.4]];
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backHome:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)clickBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)playSound:(id)sender {

    NSString *path = [[NSBundle mainBundle] pathForResource:@"clean" ofType:@"mp3"];
    _clickSoundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    _clickSoundPlayer.volume = 0.3;
    [_clickSoundPlayer play];

}

- (IBAction)clickHintClose:(id)sender {
    
    _hintView.hidden = YES;
    for (UIView *view in self.view.subviews) {
        view.userInteractionEnabled = YES;
    }
    
}

- (IBAction)clickHintBtn:(id)sender {
    
    _hintView.hidden = NO;
    for (UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIButton class]] && ![_hintView.subviews containsObject:view]) {
            view.userInteractionEnabled = NO;
        }
    }
    
}

@end
