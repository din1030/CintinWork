//
//  BushiViewController.m
//  CintinWork
//
//  Created by din1030 on 2016/1/6.
//  Copyright © 2016年 Cheng Chia Ting. All rights reserved.
//

#import "BushiViewController.h"

@interface BushiViewController ()

@end

@implementation BushiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"charID"];
    }
}

@end
