//
//  FlowerShopViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/26.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "FlowerShopViewController.h"

@interface FlowerShopViewController ()

@end

@implementation FlowerShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    
    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackA setVolume:0.8f];
    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackB setVolume:0.8f];
    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackC setVolume:1.0f];
    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].trackE setVolume:0.8f];
    //    jazz BGM
    //    [[CintinGlobalData sharedInstance] playAudio:[CintinGlobalData sharedInstance].jazzBGM setVolume:1.0f];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"char_id"];
    }
}

@end
