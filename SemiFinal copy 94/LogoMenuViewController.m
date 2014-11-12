//
//  LogoMenuViewController.m
//  SemiFinal
//
//  Created by kuku kay on 10/23/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#import "LogoMenuViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "collectionViewController.h"
#import <QuartzCore/QuartzCore.h>


#define SUBVIEW_TAG 9999
#define helpSUBVIEW_TAG 9998

@interface LogoMenuViewController ()



@property (nonatomic,weak) IBOutlet UIImageView *topDoor;
@property (nonatomic,weak) IBOutlet UIImageView *bottomDoor;
@property (nonatomic, weak) IBOutlet UIImageView *iv;
@property (nonatomic) BOOL resetdata;

@end

@implementation LogoMenuViewController

@synthesize resetdata;

- (void)viewDidLoad
{
    [super viewDidLoad];
	   
   
    UIImage * emptyimage = [[UIImage alloc] init];
    [slideToUnlock setThumbImage: [UIImage imageNamed:@"SlideToStop.png"] forState:UIControlStateNormal];
	[slideToUnlock setMinimumTrackImage:emptyimage forState:UIControlStateNormal];
	[slideToUnlock setMaximumTrackImage:emptyimage forState:UIControlStateNormal];
    
    
    self.resetdata = FALSE;
    
}

- (void) stopped:(NSString *)anim fin:(NSNumber*)fin context:(void *)context {
	self.iv.center = [[self.iv.layer valueForKey:@"origCenter"] CGPointValue];
}


// animation of the door.
- (void)viewDidAppear:(BOOL)animated
{
    
    
    CGRect topDoorFrame = self.topDoor.frame;
    topDoorFrame.origin.x =  self.view.bounds.size.width;
    
    CGRect bottomDoorFrame = self.bottomDoor.frame;
    bottomDoorFrame.origin.x = -topDoorFrame.size.width;
    
    
   
  
    
    [self delayhidden];
    NSString *squishPath = [[NSBundle mainBundle]
                            pathForResource:@"door" ofType:@"caf"];
    NSURL *squishURL = [NSURL fileURLWithPath:squishPath];
    SystemSoundID squishSoundID;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)squishURL, &squishSoundID);
    AudioServicesPlaySystemSound(squishSoundID);
    
 
    
    [UIView animateWithDuration:2.5 animations:^{
        CAMediaTimingFunction* clunk = [CAMediaTimingFunction functionWithControlPoints:.9 :.1 :.7 :.9];
        [CATransaction setAnimationTimingFunction:clunk];
        
        [UIView setAnimationRepeatAutoreverses:YES];
        [UIView setAnimationDelegate:self];
        
        
        // using stopped procedure back image to orig position
        [UIView setAnimationDidStopSelector:@selector(stopped:fin:context:)];
        CGPoint p = self.iv.center;
        [self.iv.layer setValue:[NSValue valueWithCGPoint:p] forKey:@"origCenter"];
        
        //CGPoint p = iv.center;
        p.x +=200;
        p.y +=100;
        self.iv.center = p;
    }];
    
    
    
    
    if (UIDeviceOrientationLandscapeRight) {
        
        [self performSelector:@selector(delayhidden1) withObject:nil afterDelay:1.0];
    }
    
    
   
}

-(void)delayhidden {
   
    CGRect topDoorFrame = self.topDoor.frame;
    topDoorFrame.origin.x =  self.view.bounds.size.width;
    
    CGRect bottomDoorFrame = self.bottomDoor.frame;
    bottomDoorFrame.origin.x = -topDoorFrame.size.width;
    
    
    [UIView animateWithDuration:1.0   animations:^{
        [UIView setAnimationCurve: UIViewAnimationCurveEaseInOut];
        self.topDoor.frame = topDoorFrame;
        self.bottomDoor.frame = bottomDoorFrame; }];
}

-(void)delayhidden1{
    self.topDoor.hidden = YES;
    self.bottomDoor.hidden = YES;
}

// slide button.
-(IBAction)fadeLabel {
    
	myLabel.alpha = 1.0 - slideToUnlock.value;
	
}

-(IBAction)UnLockIt {
    
    if (slideToUnlock.value ==1.0) {  // if user slide far enough, stop the operation
        // Put here what happens when it is unlocked
        
        collectionViewController * first = [ self.storyboard instantiateViewControllerWithIdentifier:@"collectionViewController"];
        
        first.resetdata1 =self.resetdata;
        self.resetdata = FALSE;
         NSLog(@"bool1: %hhd", first.resetdata1);
           [UIView animateWithDuration:0.9 animations:^{
            CATransition* transition = [CATransition animation];
            transition.duration = 0.9;
            transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            transition.type = @"cube";
            transition.subtype = @"fromLeft";
            
            [self.navigationController.view.layer removeAllAnimations];
            [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
            
            [self.navigationController pushViewController:first animated:NO];
        }];
        
        
        
        
    }
    
    
    [UIView beginAnimations: @"SlideCanceled" context: nil];
    [UIView setAnimationDelegate: self];
    [UIView setAnimationDuration: 0.35];
    // use CurveEaseOut to create "spring" effect
    [UIView setAnimationCurve: UIViewAnimationCurveEaseOut];
    slideToUnlock.value = 0.0;
    [UIView commitAnimations];
    myLabel.alpha = 1.0;
 
  
}

-(void)handleExit{
    
    UIView * subview = [self.view viewWithTag:SUBVIEW_TAG];
    [subview removeFromSuperview];
}



-(void)handleExitHelp{
    
    UIView * subview = [self.view viewWithTag:helpSUBVIEW_TAG];
    [subview removeFromSuperview];
}

-(IBAction)help {
    self.bottomDoor.hidden =YES;
    self.topDoor.hidden = YES;
    //self.view.opaque = YES;
    
    
    UIView *help;
    if (IS_IPHONE_5) {
    help =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 568, 320)];
    }
    else {
    help =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    }
    
    help.backgroundColor = [ UIColor whiteColor];
    //[self.view addSubview:about];
    
    //UIButton *exit = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 30, 30)];
    UIButton *exButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [exButton addTarget:self action:@selector(handleExitHelp) forControlEvents:UIControlEventTouchUpInside];
    exButton.backgroundColor = [UIColor cyanColor];
    
    if (IS_IPHONE_5) {
        
    [exButton setFrame:CGRectMake(529, 54, 32, 32)];
    }
    else {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
             [exButton setFrame:CGRectMake(440, 4, 32, 32)];
        }
        else {[exButton setFrame:CGRectMake(440, 50, 32, 32)];}
    }
    
    [exButton setTitle:@"Exit" forState:UIControlStateNormal];
    
   
    
    UILabel *hcontent = [ [UILabel alloc] init];
   
    [hcontent setFrame:CGRectMake(50, 0, 368, 640)];
    
    [hcontent setNumberOfLines:100]; //20];
    
    
    NSString *t1 = @"- Longpress week_thumnail to create your image of this week.";
    NSString *t2 = @"- Press 'Action' button to save image to photo library or sent this image via email.";
    NSString *t3 = @"- In Tableview, longpress first row to appear the days of week.";
    NSString *t4 = @"- When keyboard appears:                                       ";
    NSString *t5 = @"    +Type 'Note' to take note. ";
    NSString *t6 = @"    +Type 'Time' to appear time adjust.                  Enjoy planning your time.";
    
    
     if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
         
         hcontent.text =[NSString stringWithFormat:@"%@\r%@\r%@\r%@\r%@\r%@\r", t1, t2, t3, t4, t5, t6];
         
     }
     else {
         hcontent.text =[NSString stringWithFormat:@"%@\r %@ \r %@ \r%@ \r %@ \r %@ \r", t1, t2, t3, t4, t5, t6];
     }
    
    
    [help addSubview:hcontent];
    
    [help addSubview:exButton];
   
    
   
    
    if (IS_IPHONE_5) {
        hcontent.center = CGPointMake(284, 320);
    }
    else { hcontent.center = CGPointMake(240, 320);}
         //[UIView animateWithDuration:10.0   animations:^{
       [UIView animateWithDuration:30.0   animations:^{
        [UIView setAnimationCurve: UIViewAnimationCurveLinear];
        
           if (IS_IPHONE_5) {
               hcontent.center = CGPointMake(284, -59);
           }
           else { hcontent.center = CGPointMake(240, -59);}
      
       }];
    
    
    [help setTag:helpSUBVIEW_TAG];
    [self.view addSubview:help];
    
    
    
    
}

-(IBAction)About {
    self.bottomDoor.hidden =YES;
    self.topDoor.hidden = YES;
    
    UIView *about;
    if (IS_IPHONE_5) {
        about =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 568, 320)];
    }
    else {
        about =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 480, 320)];
    }
    
    about.backgroundColor = [ UIColor whiteColor];
    
    
   
    UIButton *exitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [exitButton addTarget:self action:@selector(handleExit) forControlEvents:UIControlEventTouchUpInside];
    exitButton.backgroundColor = [UIColor cyanColor];
    
    if (IS_IPHONE_5) {
        
        [exitButton setFrame:CGRectMake(529, 54, 32, 32)];
    }
    else {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
            [exitButton setFrame:CGRectMake(440, 4, 32, 32)];
        }
        else {[exitButton setFrame:CGRectMake(440, 50, 32, 32)];}
    }
    
    [exitButton setTitle:@"Exit" forState:UIControlStateNormal];
    
   
    
    UILabel *content = [ [UILabel alloc] init];
    
    [content setFrame:CGRectMake(50, 0, 368, 640)];
    
    [content setNumberOfLines:100]; //20];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        
        content.text = @"NIK iOS developer has experience in theory of project management and theory of Optimization (Mathematics Applied) which is advantage to create iPhone application for management your week time.                                                        After using over two years to study Xcode for iOS, this app which update more features later, has released for you.                                       Thank Apple for useful sample code, such as restoration, view collection which were used in this app, and other iOS tutorial online. Enjoy planning your week time.                          Feedback us at Twitter: @KukuK.                                                                                               ";
        
    }
    else {
        
        content.text = @"NIK iOS developer has experience in theory of project management and theory of Optimization (Mathematics Applied) which is advantage to create iPhone application for management your week time.                                                        After using over two years to study Xcode for iOS, this app which update more features later, has released for you.                                  Thank Apple for useful sample code, such as restoration, view collection which were used in this app, and other iOS tutorial online. Enjoy planning your week time.                          Feedback us at Twitter: @KukuK.";
    }
    
    
    [about addSubview:content];
    
    [about addSubview:exitButton];
    
    
   
    
    if (IS_IPHONE_5) {
        content.center = CGPointMake(284, 320);
    }
    else { content.center = CGPointMake(240, 320);}
    
    [UIView animateWithDuration:30.0   animations:^{
        [UIView setAnimationCurve: UIViewAnimationCurveLinear];
        
        if (IS_IPHONE_5) {
            content.center = CGPointMake(284, -59);
        }
        else { content.center = CGPointMake(240, -59);}
       
    }];
   
    
    [about setTag:SUBVIEW_TAG];
    [self.view addSubview:about];
    
}


- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
-(IBAction)resetTableDataSource {
    // Delete the file using NSFileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    for (int a = 0 ; a<49; a++) {
        
        NSString * b = [NSString stringWithFormat:@"SavedData%i",a];
       // NSLog(@"%@",b);
        
    [fileManager removeItemAtPath:[[[self applicationDocumentsDirectory] path]  stringByAppendingPathComponent:b] error:nil];
    
    }
    self.resetdata = TRUE;
   // NSLog(@"bool: %hhd", self.resetdata);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
