//
//  One5ViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/19.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "One5ViewController.h"
#import "CintinGlobalData.h"

@interface One5ViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *OLImg;
@property (strong, nonatomic) IBOutlet UIButton *back;
@property (strong, nonatomic) IBOutlet UIButton *next;

@end

@implementation One5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _back.hidden = YES;
    _next.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    
    [self doVolumeFade];
    [UIView transitionWithView:_OLImg
                      duration:2.0f
                       options:UIViewAnimationOptionAutoreverse
                    animations:^{
                        _OLImg.alpha = 1.0f;
                    }
                    completion:^(BOOL finished){
                        
                        _OLImg.frame = (CGRect){456, 210, _OLImg.frame.size.width, _OLImg.frame.size.height};
                        _OLImg.alpha = 0;
                        [UIView transitionWithView:_OLImg
                                          duration:1.0f
                                           options:0
                                        animations:^{
                                             _OLImg.alpha = 1.0f;
                                        }
                                        completion:^(BOOL finished){
                                            _back.hidden = NO;
                                            _next.hidden = NO;
                                        
                                        }];
                        
                    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)doVolumeFade {
    if ([[CintinGlobalData sharedInstance].BGM isPlaying] &&[CintinGlobalData sharedInstance].BGM.volume > 0.2f) {
        [CintinGlobalData sharedInstance].BGM.volume -= 0.05f;
        [self performSelector:@selector(doVolumeFade) withObject:nil afterDelay:0.2];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
