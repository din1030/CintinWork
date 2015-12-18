//
//  parkViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "parkViewController.h"
#import "characterViewController.h"

@interface parkViewController()

@property (strong, nonatomic) IBOutlet UIView *hintView;
- (IBAction)clickHintClose:(id)sender;
- (IBAction)selectCharacter:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet UIButton *singerBtn;
@property (strong, nonatomic) IBOutlet UIButton *OLBtn;


@end

@implementation parkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _singerBtn.userInteractionEnabled = NO;
    _OLBtn.userInteractionEnabled = NO;
    _OLBtn.alpha = 0;

}

- (void)viewDidAppear:(BOOL)animated {
    [UIView transitionWithView:_OLBtn
                      duration:1.0f
                       options:0
                    animations:^{
                        _OLBtn.alpha = 1.0f;
                    }
                    completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickHintClose:(id)sender {
    _hintView.hidden = YES;
    _singerBtn.userInteractionEnabled = YES;
    _OLBtn.userInteractionEnabled = YES;

}

- (IBAction)selectCharacter:(UIButton *)sender {
    // Create page view controller
//    characterViewController *characterVC = [self.storyboard instantiateViewControllerWithIdentifier:@"characterViewController"];
//    characterVC.char_id = sender.tag;
//    [self addChildViewController:characterVC];
//    [self.view addSubview:characterVC.view];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender {
    
    // 去人物頁面
    if ([segue.identifier isEqualToString:@"toCharVC"]) {
        [[segue destinationViewController] setValue:@(sender.tag) forKey:@"char_id"];
    }
}

@end
