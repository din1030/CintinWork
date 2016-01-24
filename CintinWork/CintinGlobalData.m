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
//        NSLog(@"Global Instanse Initailiazed");
        _BGM = [self setPlayer:_BGM pathForResource:@"openningBGM2" ofType:@"mp3"];
        _trackA = [self setPlayer:_trackA pathForResource:@"A" ofType:@"mp3"];
        _trackB = [self setPlayer:_trackB pathForResource:@"B" ofType:@"mp3"];
        _trackC = [self setPlayer:_trackC pathForResource:@"C" ofType:@"mp3"];
        _trackD = [self setPlayer:_trackD pathForResource:@"D" ofType:@"mp3"];
        _trackE = [self setPlayer:_trackE pathForResource:@"E" ofType:@"mp3"];
        _trackF = [self setPlayer:_trackF pathForResource:@"F" ofType:@"mp3"];
        _trackG = [self setPlayer:_trackG pathForResource:@"G" ofType:@"mp3"];
        _trackH = [self setPlayer:_trackH pathForResource:@"H" ofType:@"mp3"];
        _trackI = [self setPlayer:_trackI pathForResource:@"I" ofType:@"mp3"];
        _trackJ = [self setPlayer:_trackJ pathForResource:@"J" ofType:@"mp3"];
        _clickSound = [self setPlayer:_clickSound pathForResource:@"dong" ofType:@"mp3"];
        _parkSceneState = initialState;
        _lastCharID = 0;
        _playerList = @[_BGM, _trackA, _trackC, _trackD, _trackE, _trackF, _trackG, _trackH, _trackI, _trackJ];
    }
	
	return self;
}

- (AVAudioPlayer *)setPlayer:(AVAudioPlayer *)player pathForResource:(NSString *)name ofType:(NSString *)ext{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:ext];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    player.numberOfLoops = -1;
//    player.delegate = self;
    [player prepareToPlay];
    return player;
}

- (void)playTrackswithVolumes:(NSArray<NSNumber *> *)volumes{
    
//    if ([tracks count] != [volumes count]) {
//        return;
//    }
    NSArray<AVAudioPlayer *> *allTracks = @[_BGM, _trackA, _trackB, _trackC, _trackD, _trackE, _trackF, _trackG, _trackH, _trackI, _trackJ];
//    for (AVAudioPlayer *player in allTracks) {
//        if (![tracks containsObject:player]) {
//            [player setVolume:0];
//        }
//    }
    for (int i = 0; i < [allTracks count]; i++) {
        NSLog(@"Set %@ Vol = %f, Time = %f", [allTracks[i].url.absoluteString substringWithRange:NSMakeRange(allTracks[i].url.absoluteString.length-5, 4)], volumes[i].floatValue, allTracks[i].currentTime);
        [allTracks[i] setVolume:volumes[i].floatValue];
        if (!allTracks[i].isPlaying) {
            [allTracks[i] play];
        }
    
    }

}

//- (void)firstPlayTracks {
////    NSArray *allTracks = @[_BGM, _trackA, _trackB, _trackC, _trackD, _trackE, _trackF, _trackG, _trackH, _trackI, _trackJ];
//    NSArray *volumes = @[@0, @0.2f, @0, @0, @0, @0, @0, @0, @0, @0, @0];
//    [self playTrackswithVolumes:volumes];
//}

- (void)playAudio:(AVAudioPlayer *)player setVolume:(NSNumber *)volume {
    [player setVolume:volume.floatValue];
    [player play];
}

- (void)stopAudio:(AVAudioPlayer *)player{
    [player stop];
}

- (void)pauseAudio:(AVAudioPlayer *)player {
    [player pause];
}

@end
