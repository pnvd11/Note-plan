//
//  oalPlayback.m
//  SemiFinal
//
//  Created by kuku kay on 10/24/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "oalPlayback.h"
#import "MyOpenALSupport.h"


@implementation oalPlayback

@synthesize isPlaying;
@synthesize wasInterrupted;
@synthesize iPodIsPlaying;

#pragma mark Object Init / Maintenance
void interruptionListener(	void *	inClientData,
                          UInt32	inInterruptionState)
{
	oalPlayback* THIS = (__bridge oalPlayback*)inClientData;

    
        if ([THIS isPlaying]) {
            THIS.wasInterrupted = YES;
        }
	
        
		if (THIS.wasInterrupted)
		{
			[THIS startSound];
			THIS.wasInterrupted = NO;
		}
 
}



- (id)init
{
	if (self = [super init]) {
		NSString *t;
        int k = (arc4random()) % 3 ;
        switch ( k ) {
            //case 0: {t = @"Tigris";}
            case 1:  t = @"Watercolor";
                break;
            case 2:  t =@"Shogun";
            //case 2:  t =@"Tigris";
                
                break;
                
            default: t =@"Tigris";
                break;
                
        }
        
        bgURL = [[NSURL alloc] initFileURLWithPath: [[NSBundle mainBundle] pathForResource:t ofType:@"caf"]];
		
        
        bgPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bgURL error:nil];
        
		wasInterrupted = NO;
		
		// Initialize our OpenAL environment
		[self initOpenAL];
	}
	
	return self;
}

- (void)checkForMusic
{
	if (iPodIsPlaying) {
		//the iPod is playing, so we should disable the background music switch
		NSLog(@"Disabling background music, iPod is active");
		musicSwitch.enabled = NO;
	}
	else {
		musicSwitch.enabled = YES;
	}
}



#pragma mark AVAudioPlayer

- (IBAction)toggleMusic:(UISwitch*)sender {
	NSLog(@"togging music %s", sender.on ? "on" : "off");
	
		if (sender.on) {
			[bgPlayer play];
            bgPlayer.numberOfLoops = -1;
		}
		else {
			[bgPlayer stop];
		}
	
}

#pragma mark OpenAL



 

- (void) initSource
{
	ALenum error = AL_NO_ERROR;
	alGetError(); // Clear the error
    
	// Turn Looping ON
	alSourcei(source, AL_LOOPING, AL_TRUE);
	
	
	// Set Source Reference Distance
	alSourcef(source, AL_REFERENCE_DISTANCE, 50.0f);
	
	// attach OpenAL Buffer to OpenAL Source
	alSourcei(source, AL_BUFFER, buffer);
	
	if((error = alGetError()) != AL_NO_ERROR) {
		NSLog(@"Error attaching buffer to source: %x\n", error);
		exit(1);
	}
}


- (void)initOpenAL
{
	ALenum			error;
	
	// Create a new OpenAL Device
	// Pass NULL to specify the system’s default output device
	device = alcOpenDevice(NULL);
	if (device != NULL)
	{
		// Create a new OpenAL Context
		// The new context will render to the OpenAL Device just created
		context = alcCreateContext(device, 0);
		if (context != NULL)
		{
			// Make the new context the Current OpenAL Context
			alcMakeContextCurrent(context);
			
			// Create some OpenAL Buffer Objects
			alGenBuffers(1, &buffer);
			if((error = alGetError()) != AL_NO_ERROR) {
				NSLog(@"Error Generating Buffers: %x", error);
				exit(1);
			}
			
			// Create some OpenAL Source Objects
			alGenSources(1, &source);
			if(alGetError() != AL_NO_ERROR)
			{
				NSLog(@"Error generating sources! %x\n", error);
				exit(1);
			}
			
		}
	}
	// clear any errors
	alGetError();
	
	//[self initBuffer];
	[self initSource];
}

- (void)teardownOpenAL
{
	// Delete the Sources
    alDeleteSources(1, &source);
	// Delete the Buffers
    alDeleteBuffers(1, &buffer);
	
    //Release context
    alcDestroyContext(context);
    //Close device
    alcCloseDevice(device);
}

#pragma mark Play / Pause

- (void)startSound
{
	ALenum error;
	
	NSLog(@"Start!\n");
	// Begin playing our source file
	alSourcePlay(source);
	if((error = alGetError()) != AL_NO_ERROR) {
		NSLog(@"error starting source: %x\n", error);
	} else {
		// Mark our state as playing (the view looks at this)
		self.isPlaying = YES;
	}
}

- (void)stopSound
{
	ALenum error;
	
	NSLog(@"Stop!!\n");
	// Stop playing our source file
	alSourceStop(source);
	if((error = alGetError()) != AL_NO_ERROR) {
		NSLog(@"error stopping source: %x\n", error);
	} else {
		// Mark our state as not playing (the view looks at this)
		self.isPlaying = NO;
	}
}




@end
