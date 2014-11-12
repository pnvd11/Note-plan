//
//  customTableCell.m
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "customTableCell.h"

@implementation customTableCell

@synthesize editField = _editField;
@synthesize textView = _textView;
@synthesize editname = _editname;
@synthesize editname1 = _editname1;
@synthesize editname2 = _editname2;
@synthesize editname3 = _editname3;
@synthesize editname4 = _editname4;
@synthesize editname5 = _editname5;

-(NSString *) reuseIdentifier {
    return @"cellID";
}

-(void)setLongPressRecognizer:(UILongPressGestureRecognizer *)newLongPressRecognizer {
    
    if (_longPressRecognizer != newLongPressRecognizer) {
        
        if (_longPressRecognizer != nil) {
            [self removeGestureRecognizer:_longPressRecognizer];
        }
        
        if (newLongPressRecognizer != nil) {
            [self addGestureRecognizer:newLongPressRecognizer];
        }
        
        _longPressRecognizer = newLongPressRecognizer;
    }
}

@end
