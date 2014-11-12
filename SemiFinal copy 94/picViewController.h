//
//  picViewController.h
//  Note & plan
//
//  Created by kuku kay on 11/21/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface picViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate> {
    
	UIImagePickerController * myPhotopicker;
	UIImageView *selectedImage;
    
    UIView *transitionView;
    UILabel *userMsg;
	UIActivityIndicatorView *waitingToRotate;
    
    
    CGFloat lastScale;
	CGFloat lastRotation;
	CGFloat firstX;
	CGFloat firstY;
    
    int _ino;
    
    //BOOL clr;
    UIImageView *previouspic;
    
}

@property (nonatomic, retain) UIImagePickerController * myPhotopicker;
@property (nonatomic, retain) IBOutlet UIImageView *selectedImage;

@property (nonatomic, retain) IBOutlet UIView *transitionView;
@property (nonatomic, retain) IBOutlet UILabel *userMsg;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *waitingToRotate;

@property (nonatomic) int ino;


-(IBAction)loadaPhoto;
//- (NSString *)documentsPathForFileName:(NSString *)name;



@end
