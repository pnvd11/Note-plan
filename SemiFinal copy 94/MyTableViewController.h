//
//  MyTableViewController.h
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
#import "customTableCell.h"
#import "MyViewController.h"

@interface MyTableViewController : UITableViewController <UIDataSourceModelAssociation, MyViewControllerDelegate>
{
    int _z;
   
    BOOL _resetdata2;
}

@property (nonatomic) int z;
@property (nonatomic) BOOL resetdata2;
@end
