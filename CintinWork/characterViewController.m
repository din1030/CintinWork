//
//  characterViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "characterViewController.h"
#import "CintinGlobalData.h"

@interface characterViewController()

@property (strong, nonatomic) IBOutlet UIImageView *charBG;
- (IBAction)back:(id)sender;

@end

@implementation characterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%d", _char_id.intValue);
    switch ([_char_id intValue]) {
        case 1:
            _charBG.image = [UIImage imageNamed:@"2-A.png"];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackB stop];
            [[CintinGlobalData sharedInstance].trackA play];
            break;
            
        case 2:
            _charBG.image = [UIImage imageNamed:@"2-B.png"];
            [[CintinGlobalData sharedInstance].BGM stop];
            [[CintinGlobalData sharedInstance].trackA stop];
            [[CintinGlobalData sharedInstance].trackC play];
            break;
            
        case 3:
            _charBG.image = [UIImage imageNamed:@"3-C.png"];
            break;
            
        case 4:
            _charBG.image = [UIImage imageNamed:@"3-D.png"];
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

@end
