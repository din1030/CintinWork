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
@property (strong, nonatomic) IBOutlet UIImageView *charAnimation;
@property (strong, nonatomic) IBOutlet UIImageView *addedImage;

@property NSString *segueToNextScene;
@property BOOL addedTrack;
- (IBAction)clickBack:(UIButton *)sender;
- (IBAction)next:(UIButton *)sender;

@end

@implementation CharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _addedTrack = NO;
    
    switch ([_charID intValue]) {
            
        case 1:
            _charBG.image = [UIImage imageNamed:@"2-A.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_A_" duration:4.0f];
            break;
            
        case 2:
            _charBG.image = [UIImage imageNamed:@"2-B.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_B_" duration:4.0f];
            break;
            
        case 3:
            _charBG.image = [UIImage imageNamed:@"3-C.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_C_" duration:4.0f];
            break;
            
        case 4:
            _charBG.image = [UIImage imageNamed:@"3-D.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_D_" duration:4.0f];
            break;
            
        case 51:
        case 52:
            _charBG.image = [UIImage imageNamed:@"4-E.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_E_" duration:4.0f];
            break;
            
        case 61:
        case 62:
            _charBG.image = [UIImage imageNamed:@"4-F.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_F_" duration:4.0f];
            break;
            
        case 71:
        case 72:
            _charBG.image = [UIImage imageNamed:@"5-G.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_G_" duration:4.0f];
            break;
            
        case 81:
        case 82:
            _charBG.image = [UIImage imageNamed:@"5-H.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_H_" duration:4.0f];
            break;
            
        case 91:
        case 92:
            _charBG.image = [UIImage imageNamed:@"6-I.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_I_" duration:4.0f];
            break;
            
        case 101:
        case 102:
            _charBG.image = [UIImage imageNamed:@"6-J.png"];
            _charAnimation.image = [UIImage animatedImageNamed:@"ani_J_" duration:4.0f];
            break;
            
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidLoad];
    
    NSLog(@"Current Char ID: %d", _charID.intValue);
    
    switch ([_charID intValue]) {
            
        case 1:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 2:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0.8, @0, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 3:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @1, @0, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 4:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0.5, @0, @0, @0, @0, @0, @0]];
            break;
            
        case 51:  // 角色 E ~J 有兩個頁面要設定
        case 52:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0.5, @0, @0, @0, @0, @0]];
            break;
            
        case 61:
        case 62:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0.4, @0, @0, @0, @0]];
            break;
            
        case 71:
        case 72:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0.5, @0, @0, @0]];
            break;
            
        case 81:
        case 82:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0.5, @0, @0]];
            break;
            
        case 91:
        case 92:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0.4, @0]];
            
            break;
            
        case 101:
        case 102:
            [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0, @0, @0, @0, @0, @0, @0, @0, @0, @0.4]];
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
    if (_addedTrack) {
        _addedImage.hidden = YES;
        _addedTrack = NO;
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (IBAction)next:(UIButton *)sender {
    int id = [_charID intValue];
    if (id != 1 && id != 2 && !_addedTrack) {
        // 疊上主角圖跟音軌
        switch (id) {
            case 3: { //cafe，場景編號 3
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"3-C_add.png"];

                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0, @0, @0, @0, @0]];
                break;
            }
            case 4: { //flower
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"3-D_add.png"];
                                    
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0, @0, @0]];
                break;
            }
            case 51: { // flower
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"4-E_add.png"];
                                    
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0.6, @0, @0, @0, @0, @0]];
                break;
            }
            case 52: { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"4-E_add.png"];
                                    
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0.6, @0, @0.7, @0, @0, @0]];
                break;
            }
            case 61: { // bushi
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"4-F_add.png"];
                                    
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0.6, @0, @0, @0, @0]];
                break;
            }
            case 62: { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"4-F_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0.6, @0.7, @0, @0, @0]];
                break;
            }
            case 71: { //cafe
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"5-G_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0.7, @0, @0, @0]];
                break;
            }
            case 72: { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"5-G_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0.6, @0, @0.7, @0, @0, @0]];
                break;
            }
            case 81: { // bushi
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"5-H_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0.5, @0, @0]];
                break;
            }
            case 82:  { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"5-H_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0.6, @0, @0, @0.5, @0, @0]];
                break;
            }
            case 91:  { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"6-I_add.png"];
                                    
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0.6, @0, @0, @0.6, @0]];
                break;
            }
            case 92:  { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"6-I_add.png"];
                                    
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0.5, @0.6, @0]];
                break;
            }
            case 101:  { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"6-J_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @1, @0, @0, @0.6, @0, @0, @0, @0.6]];
                break;
            }
            case 102:  { // home
                [UIView transitionWithView:_addedImage
                                  duration:1.5f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    _addedImage.image = [UIImage imageNamed:@"6-J_add.png"];
                                }
                                completion:nil];
                [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0.8, @0, @0.5, @0, @0, @0, @0.5, @0, @0.6]];
                break;
            }
            default:
                break;
        }
        _addedImage.hidden = NO;
        _addedTrack = YES;
    } else {
        // 已顯示主角頁面，換場景
        switch (id) {
                
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
            case 71:
                [self performSegueWithIdentifier:@"toCafe" sender:self];
                break;
                
            case 4:
            case 51:
                [self performSegueWithIdentifier:@"toFlowerShop" sender:self];
                break;
                
            case 61:
            case 81:
                [self performSegueWithIdentifier:@"toBushiStreet" sender:self];
                break;
                
            case 52:
            case 62:
            case 72:
            case 82:
            case 91:
            case 92:
            case 101:
            case 102:
                [self performSegueWithIdentifier:@"goHome" sender:self];
                [CintinGlobalData sharedInstance].lastCharID = self.charID;
                break;
                
            default:
                break;
        }
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {

    [[segue destinationViewController] setValue:_charID forKey:@"prevCharID"];

}

@end
