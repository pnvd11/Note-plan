//
//  oalPlayback.h
//  SemiFinal
//
//  Created by kuku kay on 10/24/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

//#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#import <OpenAL/al.h>
#import <OpenAL/alc.h>

#define kDefaultDistance 25.0


@interface oalPlayback : NSObject

{
	IBOutlet	UISwitch*	musicSwitch;
    
	ALuint					source;
	ALuint					buffer;
	ALCcontext*				context;
	ALCdevice*				device;
    
	void*					data;
	
	ALfloat					sourceVolume;
	BOOL					isPlaying;
	BOOL					wasInterrupted;
	
	NSURL*					bgURL;
	AVAudioPlayer*			bgPlayer;
	UInt32					iPodIsPlaying;
	
}

@property (nonatomic, assign)	BOOL		isPlaying;			// Whether the sound is playing or stopped
@property (nonatomic, assign)	UInt32		iPodIsPlaying;		// Whether the iPod is playing
@property (nonatomic, assign)	BOOL		wasInterrupted;		// Whether playback was interrupted by the system


- (IBAction)toggleMusic:(UISwitch*)sender;
- (void)checkForMusic;

- (void)initOpenAL;
- (void)teardownOpenAL;

- (void)startSound;
- (void)stopSound;


@end
