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


@property (strong, nonatomic) IBOutlet UIImageView *leftTextImg;
@property (strong, nonatomic) IBOutlet UIImageView *rightTextImg;
@property (strong, nonatomic) IBOutlet UIButton *buskerBtn;
@property (strong, nonatomic) IBOutlet UIButton *OLBtn;
@property (strong, nonatomic) IBOutlet UIButton *next;
@property (strong, nonatomic) IBOutlet UIImageView *note;


@end

@implementation ParkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _buskerBtn.userInteractionEnabled = NO;
    _OLBtn.userInteractionEnabled = NO;
    _OLBtn.alpha = 0;
    _next.hidden = YES;
    
    _note.image = [UIImage animatedImageNamed:@"note_" duration:1.0f];

}

- (void)viewWillAppear:(BOOL)animated {
    
    switch ([CintinGlobalData sharedInstance].parkSceneState) {
            
        case initialState:
            self.hintView.hidden = YES;
            _leftTextImg.hidden = NO;
            _rightTextImg.hidden = YES;
            break;
            
        case buskerViewedState:
            self.hintView.hidden = YES;
            self.hintString.text = @"點選上班女子，聽聽她的音樂";
            _OLBtn.userInteractionEnabled = YES;
            _leftTextImg.hidden = YES;
            _rightTextImg.hidden = NO;
            break;
            
        case completedState:
            _next.hidden = NO;
            self.hintView.hidden = YES;
            _leftTextImg.hidden = YES;
            _rightTextImg.image = [UIImage imageNamed:@"2-1_text4.png"];
            _rightTextImg.hidden = NO;
            break;
            
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"parkSceneState = %d", [CintinGlobalData sharedInstance].parkSceneState);
    
    switch ([CintinGlobalData sharedInstance].parkSceneState) {
            
        case initialState: {
                [UIView transitionWithView:_OLBtn
                                  duration:3.0f
                                   options:0
                                animations:^{
                                    _OLBtn.alpha = 1.0f;
                                }
                                completion:nil];
                while (CintinGlobalData.sharedInstance.trackB.volume < 0.5) {
                    CintinGlobalData.sharedInstance.trackB.volume += 0.5;
                    sleep(0.05);
                }
                //  delay time reset
                [self performSelector:@selector(changeText) withObject:nil afterDelay:7.0f];
                [self performSelector:@selector(showHint:) withObject:_buskerBtn afterDelay:10.0f];
            
            }
            break;
    
        case buskerViewedState:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0.1, @0.1, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
            [self performSelector:@selector(showHint:) withObject:_OLBtn afterDelay:10.0f];
            break;
            
        case completedState:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0.1, @0.2, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
            break;
        
        default:
            break;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
//    [_buskerBtn stopGlowing];
    _OLBtn.alpha = 1.0f;
    _buskerBtn.alpha = 1.0f;
    [UIView cancelPreviousPerformRequestsWithTarget:self selector:@selector(showHint:) object:_OLBtn];
    [UIView cancelPreviousPerformRequestsWithTarget:self selector:@selector(showHint:) object:_buskerBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickHintClose:(id)sender {
    
    self.hintView.hidden = YES;
    switch ([CintinGlobalData sharedInstance].parkSceneState) {
        
        case initialState:
            _buskerBtn.userInteractionEnabled = YES;
            _OLBtn.userInteractionEnabled = NO;
            break;
            
        case buskerViewedState:
        case completedState:
            _buskerBtn.userInteractionEnabled = YES;
            _OLBtn.userInteractionEnabled = YES;
            break;
            
        default:
            break;
    }

}

- (void)changeText {
    
    CintinGlobalData.sharedInstance.trackB.volume = 0;
    [UIView animateWithDuration:1.0f
                     animations:^{
                         _leftTextImg.image = [UIImage imageNamed:@"2-1_text2.png"];
                     }
                     completion:^(BOOL finished){
                         _buskerBtn.userInteractionEnabled = YES;
                     }];

}

- (void)showHint:(UIButton *)btn {
    
//    [btn startGlowing];
    [UIView animateWithDuration:1.5f
                          delay:0
                        options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction
                     animations:^{ btn.alpha = 0.6f;}
                     completion:nil];

    self.hintView.hidden = NO;
    _buskerBtn.userInteractionEnabled = NO;
    _OLBtn.userInteractionEnabled = NO;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"charID"];
    }
    
}

@end
