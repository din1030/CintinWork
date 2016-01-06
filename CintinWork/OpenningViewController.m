//
//  OpenningViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/18.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "OpenningViewController.h"
#import "CintinGlobalData.h"

@interface OpenningViewController ()

@property NSArray *AnimationImg, *AnimationImg2;
@property BOOL repeat;
@property int page;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)clickNext:(id)sender;
- (IBAction)clickBack:(id)sender;

@end

@implementation OpenningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _repeat = YES;
    _page = 0;
    _AnimationImg = @[[UIImage imageNamed:@"1-1.png"], [UIImage imageNamed:@"1-2.png"], [UIImage imageNamed:@"1-3.png"],
                      [UIImage imageNamed:@"1-4_start.png"],[UIImage imageNamed:@"b1-1.png"], [UIImage imageNamed:@"b1-2.png"],
                      [UIImage imageNamed:@"b1-3.png"], [UIImage imageNamed:@"b1-4_start.png"]];
}

- (void)viewDidAppear:(BOOL)animated {
    
    [CintinGlobalData.sharedInstance playTrackswithVolumes:@[@1.0, @0.1, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fadeInOutImage:(NSArray<UIImage *> *)imageArr index:(int)i {
    _imageView.frame = (CGRect){0, 0, 1024, 768};
    [UIView transitionWithView:_imageView
                      duration:2.0f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _imageView.image = imageArr[i];
                    }
                    completion:^(BOOL finished){
                        if (i == 3 || i == [imageArr count] - 1){
                            [self rollLongImageView];
                        }
                    }];
}

- (void)rollLongImageView {
    
    _imageView.frame = (CGRect){0, -1536, 1024, 2304};
    _imageView.image = (_repeat) ? [UIImage imageNamed:@"1-4_long.png"] : [UIImage imageNamed:@"b1-4_long.png"];
    
    for(UIView *view in self.view.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            view.userInteractionEnabled = NO;
        }
    }
    [UIView transitionWithView:_imageView
                      duration:9.0f
                       options:UIViewAnimationOptionCurveLinear
                    animations:^{
                         [_imageView setFrame:(CGRect){0, 0, 1024, 2304}];
                     }
                    completion:^(BOOL finished){
                        _repeat = NO;
                        for(UIView *view in self.view.subviews) {
                            if ([view isKindOfClass:[UIButton class]]) {
                                view.userInteractionEnabled = YES;
                            }
                        }
                    }];
    
}

- (IBAction)clickNext:(id)sender {
    
    if (_page < [_AnimationImg count] - 1) {
        [self fadeInOutImage:_AnimationImg index:++_page];
    } else {
        [self performSegueWithIdentifier:@"to_1_5" sender:self];
    }
    
}

- (IBAction)clickBack:(id)sender {
    if (_page > 0) {
        [self fadeInOutImage:_AnimationImg index:--_page];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

@end
