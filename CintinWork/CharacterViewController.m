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
@property NSString *segueToNextScene;
- (IBAction)back:(UIButton *)sender;
- (IBAction)next:(UIButton *)sender;

@end

@implementation CharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d", _char_id.intValue);
    switch ([_char_id intValue]) {
            
        case 1:
            _charBG.image = [UIImage imageNamed:@"2-A.png"];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackA play];
            break;
            
        case 2:
            _charBG.image = [UIImage imageNamed:@"2-B.png"];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB play];
            break;
            
        case 3:
            _charBG.image = [UIImage imageNamed:@"3-C.png"];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC play];
            break;
            
        case 4:
            _charBG.image = [UIImage imageNamed:@"3-D.png"];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackD play];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)back:(id)sender {
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
