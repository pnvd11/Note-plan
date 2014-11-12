//
//  Item.h
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *notes;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *name1;
@property (nonatomic, strong) NSString *name2;
@property (nonatomic, strong) NSString *name3;
@property (nonatomic, strong) NSString *name4;
@property (nonatomic, strong) NSString *name5;
@property (nonatomic, strong) NSString *name6;


- (id)initWithTitle:(NSString *)title notes:(NSString *)notes name:(NSString *)name name1:(NSString *)name1 name2:(NSString *)name2 name3:(NSString *)name3 name4:(NSString *)name4 name5:(NSString *)name5 name6:(NSString *)name6;



@end
