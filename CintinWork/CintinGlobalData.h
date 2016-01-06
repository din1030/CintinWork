//
//  CintinGlobalData.h
//  iBeaGuide
//
//  Created by din1030 on 2015/12/13.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVAudioPlayer.h>
#import "CintinGlobalData.h"

typedef NS_ENUM(NSUInteger, ParkSceneState) {
    initialState = 0,
    buskerViewedState,
    completedState,
};

@interface CintinGlobalData : NSObject <AVAudioPlayerDelegate>

@property AVAudioPlayer *BGM;
@property AVAudioPlayer *trackA;
@property AVAudioPlayer *trackB;
@property AVAudioPlayer *trackC;
@property AVAudioPlayer *trackD;
@property AVAudioPlayer *trackE;
@property AVAudioPlayer *trackF;
@property AVAudioPlayer *trackG;
@property AVAudioPlayer *trackH;
@property AVAudioPlayer *trackI;
@property AVAudioPlayer *trackJ;
@property ParkSceneState parkSceneState;

+ (CintinGlobalData *)sharedInstance;
- (void)playAudio:(AVAudioPlayer *)player setVolume:(NSNumber *)volume;
- (void)playTrackswithVolumes:(NSArray<NSNumber *> *)volumes;
- (void)stopAudio:(AVAudioPlayer *)player;
- (void)pauseAudio:(AVAudioPlayer *)player;

@end


