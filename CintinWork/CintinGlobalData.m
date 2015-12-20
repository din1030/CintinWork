//
//  CintinGlobalData.m
//  iBeaGuide
//
//  Created by din1030 on 2015/12/13.
//  Copyright © 2015年 Cheng Chia Ting. All rights reserved.
//

#import "CintinGlobalData.h"

@implementation CintinGlobalData 

+ (CintinGlobalData *)sharedInstance {
	
	static CintinGlobalData *sharedInstance;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [[CintinGlobalData alloc] init];
	});
	
	return sharedInstance;
}

- (id)init {
	
	if (self = [super init]) {
        _BGM = [self setPlayer:_BGM pathForResource:@"openningBGM" ofType:@"wav"];
        _trackA = [self setPlayer:_trackA pathForResource:@"A" ofType:@"mp3"];
        _trackB = [self setPlayer:_trackB pathForResource:@"B" ofType:@"mp3"];
        _trackC = [self setPlayer:_trackC pathForResource:@"C" ofType:@"mp3"];
        _parkSceneState = initialState;
    }
	
	return self;
}

- (AVAudioPlayer *)setPlayer:(AVAudioPlayer *)player pathForResource:(NSString *)name ofType:(NSString *)ext{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:ext];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    player.numberOfLoops = -1;
    player.delegate = self;
    [player prepareToPlay];
    return player;
}

- (void)playAudio:(AVAudioPlayer *)player setVolume:(float)volume {
    [player setVolume:volume];
    [player play];
}

- (void)stopAudio:(AVAudioPlayer *)player{
    [player stop];
}

- (void)pauseAudio:(AVAudioPlayer *)player {
    [player pause];
}

@end
