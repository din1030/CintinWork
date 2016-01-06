//
//  CharacterViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "CharacterViewController.h"
#import "CintinGlobalData.h"

@interface CharacterViewController()

@property (strong, nonatomic) IBOutlet UIImageView *charBG;
@property (strong, nonatomic) IBOutlet UIImageView *hintNote;
@property NSString *segueToNextScene;
- (IBAction)clickBack:(UIButton *)sender;
- (IBAction)next:(UIButton *)sender;

@end

@implementation CharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIView animateWithDuration:1.0
                          delay:1.0
                        options:UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionRepeat
                     animations:^{
                         _hintNote.frame = (CGRect){946, 625, 48, 55};
                     }
                     completion:nil];

    //transitionWithView:_OLBtn
//                      duration:3.0f
//                       options:0
//                    animations:^{
//                        _OLBtn.alpha = 1.0f;
//                    }
//                    completion:nil];


    NSLog(@"%d", _char_id.intValue);
    switch ([_char_id intValue]) {
            
        case 1:
            _charBG.image = [UIImage imageNamed:@"2-A.png"];
            break;
            
        case 2:
            _charBG.image = [UIImage imageNamed:@"2-B.png"];
            break;
            
        case 3:
            _charBG.image = [UIImage imageNamed:@"3-C.png"];
            break;
            
        case 4:
            _charBG.image = [UIImage imageNamed:@"3-D.png"];
            break;
            
        case 5:
            _charBG.image = [UIImage imageNamed:@"4-E.png"];
            break;
            
        case 6:
            _charBG.image = [UIImage imageNamed:@"4-F.png"];
            break;
            
        case 7:
            _charBG.image = [UIImage imageNamed:@"5-G.png"];
            break;
            
        case 8:
            _charBG.image = [UIImage imageNamed:@"5-H.png"];
            break;
            
        case 9:
            _charBG.image = [UIImage imageNamed:@"6-I.png"];
            break;
            
        case 10:
            _charBG.image = [UIImage imageNamed:@"6-J.png"];
            break;
            
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    
    NSLog(@"%d", _char_id.intValue);
    switch ([_char_id intValue]) {
            
        case 1:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.2, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 2:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 3:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @1, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 4:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0.8, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 5:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0.8, @0, @0, @0, @0, @0]];
            
            break;
            
        case 6:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0.8, @0, @0, @0, @0]];
            
            break;
            
        case 7:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0.8, @0, @0, @0]];
            
            break;
            
        case 8:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0.8, @0, @0]];
            
            break;
            
        case 9:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0.8, @0]];
            
            break;
            
        case 10:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0.8]];
            break;
            
        default:
            break;
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)next:(UIButton *)sender {
    
    [[CintinGlobalData sharedInstance].BGM stop];
    [[CintinGlobalData sharedInstance].trackA stop];
    [[CintinGlobalData sharedInstance].trackC stop];
    
    switch ([_char_id intValue]) {
            
        case 1:
            [CintinGlobalData sharedInstance].parkSceneState = completedState;
            // pop 回公園頁面
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        case 2:
            [CintinGlobalData sharedInstance].parkSceneState = buskerViewedState;
            // pop 回公園頁面
            [self.navigationController popViewControllerAnimated:YES];
            break;
            
        case 3:
            [self performSegueWithIdentifier:@"toCafe" sender:self];
            break;
            
        case 4:
            [self performSegueWithIdentifier:@"toFlowerShop" sender:self];
            break;
            
        default:
            break;
            
    }
    
}

@end
