//
//  picViewController.m
//  Note & plan
//
//  Created by kuku kay on 11/21/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "picViewController.h"
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

@interface picViewController ()


@end

@implementation picViewController


@synthesize  ino = _ino;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

@synthesize myPhotopicker, transitionView, selectedImage, waitingToRotate, userMsg;

BOOL WANTSPORTRAIT = NO;

-(IBAction)loadaPhoto {
	
    if (myPhotopicker==nil) { myPhotopicker = [[UIImagePickerController alloc] init];
        myPhotopicker.delegate = self; }// create once!
    myPhotopicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self presentViewController:myPhotopicker animated:YES completion:nil];
	WANTSPORTRAIT = YES;
    

	[self.view bringSubviewToFront:transitionView];
	transitionView.frame = CGRectMake(0,0, 568, 320);
	userMsg.frame = CGRectMake(159, 121, userMsg.frame.size.width,  userMsg.frame.size.height);
	waitingToRotate.frame = CGRectMake(235,150, waitingToRotate.frame.size.width,waitingToRotate.frame.size.height);
	transitionView.hidden = YES;
	[waitingToRotate startAnimating];
    }

-(IBAction)savePic: (id)sender {
	
	UIGraphicsBeginImageContext(self.view.bounds.size);

	[self.view.layer renderInContext: UIGraphicsGetCurrentContext()];
	UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
    
    if (img) {
        UIActivityViewController *avc = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObject:img] applicationActivities:nil];
        avc.restorationIdentifier = @"Activity";
        [self presentViewController:avc animated:YES completion:nil];
    }
}


-(IBAction)storeBt: (id)sender {
    
    
   
        
        UIGraphicsBeginImageContext(self.view.bounds.size);
    //UIGraphicsBeginImageContext(self.view.layer.bounds.size);
                [self.view.layer renderInContext: UIGraphicsGetCurrentContext()];
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
        UIGraphicsEndImageContext();
    
        // save pic to file.
        NSData *pngData = UIImagePNGRepresentation(img);
        
    
        NSString * filePath = [self documentsPathForFileName:[NSString stringWithFormat:@"image%i.png",self.ino]];
    NSLog(@"ino pic:%i",self.ino);
    
        [pngData writeToFile:filePath atomically:YES]; //Write the file
        
        
   // }];
    
}

-(IBAction)clearscreen:(id)sender {
    
     NSFileManager *fileManager = [NSFileManager defaultManager];
    
     NSString * filePath = [self documentsPathForFileName:[NSString stringWithFormat:@"image%i.png",self.ino]];
    [fileManager removeItemAtPath:filePath  error:nil];
    
    //clr = TRUE;
    previouspic.image = nil;
}
    


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissViewControllerAnimated:YES completion:nil];
	
    WANTSPORTRAIT = NO;
	
    selectedImage.image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    
    
    //Gesture.
    
    selectedImage.hidden =YES;
    
    float percentage = [self scaleImage:selectedImage.image] / 2;
    CGSize startingSize;
    startingSize = CGSizeMake(selectedImage.image.size.width*percentage,selectedImage.image.size.height*percentage);
    
    UIView *holderView = [[UIView alloc] initWithFrame:CGRectMake(5,29,startingSize.width, startingSize.height)];
    //holderView.layer.cornerRadius = 50;
    
	UIImageView *imageview = [[UIImageView alloc] initWithFrame:[holderView frame]];
	[imageview setImage:selectedImage.image];
    //[imageview.layer setImage: selectedImage.image];
    //imageview.layer.cornerRadius = 50;
    imageview.layer.mask.frame = [holderView frame];
    imageview.layer.masksToBounds = YES;
    imageview.layer.cornerRadius = 10.0;
    imageview.layer.borderWidth = 1.0;
    imageview.layer.borderColor = [[UIColor brownColor] CGColor];
    
	[holderView addSubview:imageview];
    //[holderView.layer addSublayer:imageview.layer];
    
    
	
	UIPinchGestureRecognizer *pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(scale:)];
	[pinchRecognizer setDelegate:self];
	[holderView addGestureRecognizer:pinchRecognizer];
	
	UIRotationGestureRecognizer *rotationRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
	[rotationRecognizer setDelegate:self];
	[holderView addGestureRecognizer:rotationRecognizer];
	
	UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
	[panRecognizer setMinimumNumberOfTouches:1];
	[panRecognizer setMaximumNumberOfTouches:1];
	[panRecognizer setDelegate:self];
	[holderView addGestureRecognizer:panRecognizer];
	
	
	UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
	[tapRecognizer setNumberOfTapsRequired:1];
	[tapRecognizer setDelegate:self];
	[holderView addGestureRecognizer: tapRecognizer];
	
	[self.view addSubview:holderView];

	
    
    // fake portrait orientation.
    
    transitionView.frame = CGRectMake(0, 0, 320, 568);
	userMsg.frame = CGRectMake(70, 199,userMsg.frame.size.width,  userMsg.frame.size.height);
	waitingToRotate.frame = CGRectMake(146,228, waitingToRotate.frame.size.width,waitingToRotate.frame.size.height);
	
	//transitionView.hidden= NO;
   transitionView.hidden= YES;
	[self.view bringSubviewToFront:transitionView];
    
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{ //cancel
	
	[picker dismissViewControllerAnimated:YES completion:nil];
	
}




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	self.title = @"Everlasting moment";
    //self.view.layer.cornerRadius = 50;
    
    transitionView.frame = CGRectMake(0, 0, 568	, 320);
	transitionView.hidden = YES;
    
    // reading previous pic.
    NSString * path = [self documentsPathForFileName:[NSString stringWithFormat:@"image%i.png", self.ino]];
    NSData *pngData = [NSData dataWithContentsOfFile: path];
    
        if (IS_IPHONE_5) {
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
                previouspic = [[UIImageView alloc] initWithFrame:CGRectMake(5,1, 568, 232)];
            }
            else {
                previouspic = [[UIImageView alloc] initWithFrame:CGRectMake(5,1, 568,320)];   //276)];
            }
        }
        else {
            if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
                previouspic = [[UIImageView alloc] initWithFrame:CGRectMake(5,1, 480, 232)];
            }
            else {
            previouspic = [[UIImageView alloc] initWithFrame:CGRectMake(5,1, 480, 320)];
            }
        }
    
    
    previouspic.image = [ UIImage imageWithData:pngData];
    [self.view addSubview:previouspic];
   
    [super viewDidLoad];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
	if (!WANTSPORTRAIT) {
		transitionView.hidden= YES;
	    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
		
	} else {
		
		if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]) {
			if (myPhotopicker==nil) { myPhotopicker = [[UIImagePickerController alloc] init];
                myPhotopicker.delegate = self; }// create once!
			myPhotopicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
			
			[self presentViewController:myPhotopicker animated:YES completion:nil];
            
		} else {
			NSString *str = @"Photo Album is not available!";
			UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unaccessable" message:str delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
			[alert show];
		}
		transitionView.hidden = YES;
		return (interfaceOrientation == UIInterfaceOrientationPortrait);
	}
}


#pragma Gesture
-(void)scale:(id)sender {
	[self.view bringSubviewToFront:[(UIPinchGestureRecognizer*)sender view]];
	if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
		lastScale = 1.0;
		return;
	}
	
	CGFloat scale = 1.0 - (lastScale - [(UIPinchGestureRecognizer*)sender scale]);
	
	CGAffineTransform currentTransform = [(UIPinchGestureRecognizer*)sender view].transform;
	CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
	
	[[(UIPinchGestureRecognizer*)sender view] setTransform:newTransform];
	
	lastScale = [(UIPinchGestureRecognizer*)sender scale];
}

-(void)rotate:(id)sender {
	[self.view bringSubviewToFront:[(UIRotationGestureRecognizer*)sender view]];
	
	if([(UIRotationGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
		
		lastRotation = 0.0;
		return;
	}
	
	CGFloat rotation = 0.0 - (lastRotation - [(UIRotationGestureRecognizer*)sender rotation]);
	CGAffineTransform currentTransform = [(UIPinchGestureRecognizer*)sender view].transform;
	CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform, rotation);
	
	[[(UIRotationGestureRecognizer*)sender view] setTransform:newTransform];
	
	lastRotation = [(UIRotationGestureRecognizer*)sender rotation];
}

-(void)move: (id)sender {
	
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
	
	[self.view bringSubviewToFront:[(UIPanGestureRecognizer*)sender view]];
	CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];
	
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
		
		firstX = [[sender view] center].x;
		firstY = [[sender view] center].y;
    }
	
	translatedPoint = CGPointMake(firstX + translatedPoint.x, firstY + translatedPoint.y);
	[[sender view] setCenter:translatedPoint];
	
	if([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
		
		CGFloat finalX = translatedPoint.x + (.35*[(UIPanGestureRecognizer*)sender velocityInView:self.view].x);
		CGFloat finalY = translatedPoint.y + (.35*[(UIPanGestureRecognizer*)sender velocityInView:self.view].y);
		
		if(UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation])) {
			
            if (IS_IPHONE_5) {
                
               if(finalX <60 ){
				
				finalX =60;
			   }
			
		       else if(finalX > 558) {
				
                   finalX = 558;
               }
            
		        if(finalY <29){
				
				finalY = 29;
			    }
			
		         else if(finalY >212) {
				
				finalY = 212;
			    }
			    }
		
		       else {
			   if(finalX < 60 ){
				
				finalX = 60;
			   }
			
		       else if(finalX > 558){
				
                   finalX = 558;
			    }
			
		        if(finalY < 44) {
				
				finalY = 44;
			    }
			
		        else if(finalY > 212){
				
				finalY = 212;
			     }
			   }
        }
        else {
            if(finalX <60 ) {
				
				finalX =60;
            }
			
            else if(finalX > 436){
				
				finalX = 436;
            }
            
            if(finalY <29){
				
				finalY = 29;
            }
			
            else if(finalY >212) {
				
				finalY = 212;
            }
		   
            else {
            if(finalX < 60 ){
				finalX = 60;
            }
			
            else if(finalX > 436 ) {
				
				finalX = 436;
            }
			
            if(finalY < 44) {
				
				finalY = 44;
            }
			
            else if(finalY > 212){
				
				finalY = 212;
            }
        }
        }
        
        
		
		
		[UIView beginAnimations:nil context:NULL];
		[UIView setAnimationCurve:.35];
		[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
		[[sender view] setCenter:CGPointMake(finalX, finalY)];
		[UIView commitAnimations];
	}
}



-(void)tapped: (id)sender {
	
	[[[(UITapGestureRecognizer*)sender view] layer] removeAllAnimations];
}

- (BOOL)gestureRecognizer: (UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultanouslyWithGestureRecognizer: (UIGestureRecognizer *)otherGestureRecognizer {
	
	return ![gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]];
}


-(float) scaleImage:(UIImage *)image {
	float toSize = 1.0;
	
    if (IS_IPHONE_5) {
        
    
    if (image.size.width * toSize > 568) {
		toSize = 320 / image.size.width;
	}
	if (image.size.height * toSize > 320) {
		toSize = 568 / image.size.height;
	}
    
    }
    else{
      
        if (image.size.width * toSize > 320) {
            toSize = 320 / image.size.width;
        }
        if (image.size.height * toSize > 460) {
            toSize = 460 / image.size.height;
        }
        
    }
    
        
	return toSize;
}

#pragma url_to_save_pic
- (NSString *)documentsPathForFileName:(NSString *)name
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsPath = [paths objectAtIndex:0];
    
    return [documentsPath stringByAppendingPathComponent:name];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
