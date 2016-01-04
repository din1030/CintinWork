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
- (IBAction)clickBack:(UIButton *)sender;
- (IBAction)next:(UIButton *)sender;

@end

@implementation CharacterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%d", _char_id.intValue);
    switch ([_char_id intValue]) {
            
        case 1:
            _charBG.image = [UIImage imageNamed:@"2-A.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            break;
            
        case 2:
            _charBG.image = [UIImage imageNamed:@"2-B.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackB setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            break;
            
        case 3:
            _charBG.image = [UIImage imageNamed:@"3-C.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackC setVolume:1.0f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            break;
            
        case 4:
            _charBG.image = [UIImage imageNamed:@"3-D.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackD setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            break;
            
        case 5:
            _charBG.image = [UIImage imageNamed:@"4-E.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackE setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            [[CintinGlobalData sharedInstance].trackF stop];
            break;
            
        case 6:
            _charBG.image = [UIImage imageNamed:@"4-F.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackF setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            [[CintinGlobalData sharedInstance].trackE stop];
            break;
            
        case 7:
            _charBG.image = [UIImage imageNamed:@"5-G.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackG setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            [[CintinGlobalData sharedInstance].trackE stop];
            [[CintinGlobalData sharedInstance].trackF stop];
            [[CintinGlobalData sharedInstance].trackH stop];
            break;
            
        case 8:
            _charBG.image = [UIImage imageNamed:@"5-H.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackH setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            [[CintinGlobalData sharedInstance].trackE stop];
            [[CintinGlobalData sharedInstance].trackF stop];
            [[CintinGlobalData sharedInstance].trackG stop];
            break;
            
        case 9:
            _charBG.image = [UIImage imageNamed:@"6-I.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackI setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            [[CintinGlobalData sharedInstance].trackE stop];
            [[CintinGlobalData sharedInstance].trackF stop];
            [[CintinGlobalData sharedInstance].trackG stop];
            [[CintinGlobalData sharedInstance].trackH stop];
            [[CintinGlobalData sharedInstance].trackJ stop];
            break;
            
        case 10:
            _charBG.image = [UIImage imageNamed:@"6-J.png"];
            [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackJ setVolume:0.8f];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackC stop];
            [[CintinGlobalData sharedInstance].trackD stop];
            [[CintinGlobalData sharedInstance].trackE stop];
            [[CintinGlobalData sharedInstance].trackF stop];
            [[CintinGlobalData sharedInstance].trackG stop];
            [[CintinGlobalData sharedInstance].trackH stop];
            [[CintinGlobalData sharedInstance].trackI stop];
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
