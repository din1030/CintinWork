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
    
    [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.6, @0.8, @1, @0, @.8, @0, @0, @0, @0, @0]];
    
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
