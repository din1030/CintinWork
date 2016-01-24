//
//  CafeViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "CafeViewController.h"

@interface CafeViewController ()

@end

@implementation CafeViewController

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
