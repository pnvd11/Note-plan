//
//  LogoMenuViewController.h
//  SemiFinal
//
//  Created by kuku kay on 10/23/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogoMenuViewController : UIViewController

{
    IBOutlet UISlider *slideToUnlock;
	IBOutlet UILabel *myLabel;
    IBOutlet UIImageView *Container;
    BOOL  resetdata;
}

-(IBAction)UnLockIt;
-(IBAction)fadeLabel;
-(IBAction)About;
-(IBAction)resetTableDataSource;
@end
