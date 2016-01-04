//
//  GeneralViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "GeneralViewController.h"

@interface GeneralViewController ()

- (IBAction)backHome:(UIButton *)sender;
- (IBAction)clickBack:(UIButton *)sender;

@end

@implementation GeneralViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backHome:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)clickBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
