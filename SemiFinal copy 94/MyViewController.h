//
//  MyViewController.h
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item, MyViewController;

@protocol MyViewControllerDelegate;

@interface MyViewController : UIViewController {
    int _w,_x, h1, h1down, m1, m1down, h2, hdown2, m2, mdown2;
  
}

@property (nonatomic) int w,x, h1, h1down, m1, m1down, h2, hdown2, m2, mdown2;
@property (nonatomic, weak) Item *item;
@property (nonatomic, weak) id <MyViewControllerDelegate> delegate;

-(IBAction)hour1change;
-(IBAction)hour1changedown;
-(IBAction)mins1change;
-(IBAction)mins1changedown;

-(IBAction)hr2change;
-(IBAction)hr2changedown;
-(IBAction)m2change;
-(IBAction)m2changedown;

@end


@protocol MyViewControllerDelegate <NSObject>
@required
- (void)editHasEnded:(MyViewController *)viewController withItem:(Item *)item;
@end