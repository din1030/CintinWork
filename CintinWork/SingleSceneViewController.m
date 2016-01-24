//
//  SingleSceneViewController.m
//  CintinWork
//
//  Created by din1030 on 2015/12/29.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "SingleSceneViewController.h"
#import "UIView+Glow.h"

@interface SingleSceneViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *bgAnimation;
@property (strong, nonatomic) IBOutlet UIButton *roomRecord;
@property (strong, nonatomic) IBOutlet UIButton *apt;

@end

@implementation SingleSceneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"RID: %@", self.restorationIdentifier);

    if ([self.restorationIdentifier isEqualToString:@"home"]) {
        // 動畫
        NSMutableArray *animationImg = [NSMutableArray arrayWithObjects:
                                        [UIImage imageNamed:@"cover_1.jpg"],
                                        [UIImage imageNamed:@"cover_2.jpg"],
                                        [UIImage imageNamed:@"cover_3.jpg"],nil];
        
        [self.bgAnimation setAnimationImages: animationImg];
        [self.bgAnimation setAnimationDuration: 1.0];
        [self.bgAnimation startAnimating];
        
        [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
        
    } else if ([self.restorationIdentifier isEqualToString:@"intro"]) {
        
        [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1f, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
        
    } else if ([self.restorationIdentifier isEqualToString:@"b4Cafe"]) {
        
//        [[CintinGlobalData sharedInstance] playTrackswithVolumes:@[@0, @0.1f, @0, @0, @0, @0, @0, @0, @0, @0, @0]];
        
    } else if ([self.restorationIdentifier isEqualToString:@"homeScene"]) {
        
        // 動畫
        self.bgAnimation.image = [UIImage animatedImageNamed:@"7-1_" duration:1.0];
        
        [UIView animateWithDuration:1.5f
                              delay:0
                            options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction
                         animations:^{ _apt.alpha = 0.6f;}
                         completion:nil];
        
    } else if ([self.restorationIdentifier isEqualToString:@"room"]) {
        
        for (AVAudioPlayer *player in CintinGlobalData.sharedInstance.playerList) {
            [self doVolumeFadeForPlayer:player];
        }
        
        [UIView animateWithDuration:1.5f
                              delay:0
                            options:UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse|UIViewAnimationOptionAllowUserInteraction
                         animations:^{ _roomRecord.alpha = 0.6f;}
                         completion:nil];
        
    }

}

- (void)doVolumeFadeForPlayer:(AVAudioPlayer *)player {
    if ([player isPlaying] && player.volume > 0.1f) {
        player.volume -= 0.025f;
        [self performSelector:@selector(doVolumeFadeForPlayer:) withObject:player afterDelay:0.25f];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([self.restorationIdentifier isEqualToString:@"b4Cafe"] || [self.restorationIdentifier isEqualToString:@"homeScene"]) {
        [[segue destinationViewController] setValue:self.prevCharID forKey:@"prevCharID"];
    }
}


@end
