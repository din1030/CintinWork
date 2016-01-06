//
//  ParkViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "ParkViewController.h"
#import "characterViewController.h"
#import "UIView+Glow.h"

@interface ParkViewController()

@property (strong, nonatomic) IBOutlet UIView *hintView;
@property (strong, nonatomic) IBOutlet UILabel *hintString;
- (IBAction)clickHintClose:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *leftTextImg;
@property (strong, nonatomic) IBOutlet UIImageView *rightTextImg;
@property (strong, nonatomic) IBOutlet UIButton *buskerBtn;
@property (strong, nonatomic) IBOutlet UIButton *OLBtn;
@property (strong, nonatomic) IBOutlet UIButton *next;


@end

@implementation ParkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _buskerBtn.userInteractionEnabled = NO;
    _OLBtn.userInteractionEnabled = NO;
    _OLBtn.alpha = 0;
    _next.hidden = YES;

}

- (void)viewWillAppear:(BOOL)animated {
    switch ([CintinGlobalData sharedInstance].parkSceneState) {
            
        case initialState:
            _hintView.hidden = YES;
            _leftTextImg.hidden = NO;
            _rightTextImg.hidden = YES;
            break;
            
        case buskerViewedState:
            _hintView.hidden = YES;
            _hintString.text = @"點選自己，聽聽我的音樂";
            _OLBtn.userInteractionEnabled = YES;
            _leftTextImg.hidden = YES;
            _rightTextImg.hidden = NO;
            break;
            
        case completedState:
            _next.hidden = NO;
            _rightTextImg.image = [UIImage imageNamed:@"2-1_text4.png"];
            _rightTextImg.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    switch ([CintinGlobalData sharedInstance].parkSceneState) {
            
        case initialState: {
            while (CintinGlobalData.sharedInstance.trackB.volume < 0.5) {
                CintinGlobalData.sharedInstance.trackB.volume += 0.25;
                sleep(0.05);
            }
            [UIView transitionWithView:_OLBtn
                              duration:3.0f
                               options:0
                            animations:^{
                                _OLBtn.alpha = 1.0f;
                            }
                            completion:nil];
            
            [self performSelector:@selector(changeText) withObject:nil afterDelay:7.0f];
            [self performSelector:@selector(characterGlow:) withObject:_buskerBtn afterDelay:10.0f];
            
            }
            break;
    
        case buskerViewedState:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0.1, @0.1, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
            [self performSelector:@selector(characterGlow:) withObject:_OLBtn afterDelay:10.0f];
            break;
            
        case completedState:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0.1, @0.2, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
            break;
        
        default:
            break;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [_buskerBtn stopGlowing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickHintClose:(id)sender {
    _hintView.hidden = YES;

}

- (void)changeText {
    
    CintinGlobalData.sharedInstance.trackB.volume = 0;
    [UIView animateWithDuration:1.0f
                     animations:^{
                         _leftTextImg.image = [UIImage imageNamed:@"2-1_text2.png"];
                     }
                     completion:nil];
    _buskerBtn.userInteractionEnabled = YES;

}

- (void)characterGlow:(UIButton *)btn {
    [btn startGlowing];
    _hintView.hidden = NO;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"char_id"];
    }
}

@end
