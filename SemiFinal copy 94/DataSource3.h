//
//  DataSource3.h
//  xXx
//
//  Created by kuku kay on 11/5/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"
@interface DataSource3 : NSObject
+ (DataSource3 *)sharedInstance;

- (NSInteger)count;

- (void)addItem:(Item *)item;
- (Item *)itemAtIndex:(NSInteger)index;
- (void)removeItemAtIndex:(NSInteger)index;
- (void)insertItem:(Item *)item atIndex:(NSInteger)index;
- (void)replaceItemAtIndex:(NSInteger)index withObject:(Item *)item;

- (Item *)itemWithIdentifier:(NSString *)identifier;
- (NSIndexPath *)indexPathForItem:(Item *)item;

- (void)save;
@end
