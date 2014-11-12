//
//  Item.m
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "Item.h"

@implementation Item

- (NSArray *)keysForEncoding;
{
    return [NSArray arrayWithObjects:@"title", @"notes",@"name",@"name1",@"name2",@"name3",@"name4",@"name5",@"name6", @"identifier", nil];
}

- (id)initWithTitle:(NSString *)title notes:(NSString *)notes name:(NSString *)name name1:(NSString *)name1 name2:(NSString *)name2 name3:(NSString *)name3 name4:(NSString *)name4 name5:(NSString *)name5 name6:(NSString *)name6
{
    self = [super init];
    if (self)
    {
        self.title = title;
        self.notes = notes;
        self.name = name;
        self.name1 = name1;
        self.name2 = name2;
        self.name3 = name3;
        self.name4 = name4;
        self.name5 = name5;
        self.name6 = name6;
        
        // create a unique identifier for this object, helps with state restoration
        NSUUID *uuid = [[NSUUID alloc] init];
        self.identifier = [uuid UUIDString];
    }
    return self;
}

// we are being created based on what was archived earlier
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        for (NSString *key in self.keysForEncoding)
        {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

// we are asked to be archived, encode all our data
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	for (NSString *key in self.keysForEncoding)
    {
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

@end
