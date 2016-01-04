//
//  ParkViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "ParkViewController.h"
#import "characterViewController.h"

@interface ParkViewController()

@property (strong, nonatomic) IBOutlet UIView *hintView;
- (IBAction)clickHintClose:(id)sender;
- (IBAction)selectCharacter:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *buskerBtn;
@property (strong, nonatomic) IBOutlet UIButton *OLBtn;
@property (strong, nonatomic) IBOutlet UIButton *next;
@property (strong, nonatomic) IBOutlet UIButton *hint;


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
        
        case buskerViewedState:
            _OLBtn.userInteractionEnabled = YES;
            break;
            
        case completedState:
            _next.hidden = NO;
            _hint.hidden = YES;
            break;
            
        case initialState:
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    
    switch ([CintinGlobalData sharedInstance].parkSceneState) {
            
        case initialState: {
            [UIView transitionWithView:_OLBtn
                              duration:3.0f
                               options:0
                            animations:^{
                                _OLBtn.alpha = 1.0f;
                            }
                            completion:nil];
            }
            break;
            
        case buskerViewedState:
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].BGM setVolume:0.1f];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.2f];
//            [[CintinGlobalData sharedInstance].BGM play];
//            [[CintinGlobalData sharedInstance].trackA play];
//            [[CintinGlobalData sharedInstance].trackC play];
            break;
            
        case completedState:
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].BGM setVolume:0.1f];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.8f];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackB setVolume:0.8f];
//            [[CintinGlobalData sharedInstance].BGM play];
//            [[CintinGlobalData sharedInstance].trackA play];
//            [[CintinGlobalData sharedInstance].trackC play];
            break;
        
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickHintClose:(id)sender {
    _hintView.hidden = YES;
    _buskerBtn.userInteractionEnabled = YES;

}

- (IBAction)selectCharacter:(UIButton *)sender {
    // Create page view controller
//    characterViewController *characterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"characterViewController"];
//    characterVC.char_id = sender.tag;
//    [self addChildViewController:characterVC];
//    [self.view addSubview:characterVC.view];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"char_id"];
    }
}

@end
