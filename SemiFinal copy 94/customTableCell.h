//
//  customTableCell.h
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *editField;
@property (nonatomic, weak) IBOutlet UILabel *textView;
@property (nonatomic, weak) IBOutlet UILabel *editname;
@property (nonatomic, weak) IBOutlet UILabel *editname1;
@property (nonatomic, weak) IBOutlet UILabel *editname2;
@property (nonatomic, weak) IBOutlet UILabel *editname3;
@property (nonatomic, weak) IBOutlet UILabel *editname4;
@property (nonatomic, weak) IBOutlet UILabel *editname5;
@property (nonatomic, weak) IBOutlet UILabel *editname6;

@property (nonatomic) UILongPressGestureRecognizer *longPressRecognizer;
@end
