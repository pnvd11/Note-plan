//
//  DataSource4.m
//  xXx
//
//  Created by kuku kay on 11/5/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "DataSource4.h"
@interface DataSource4 ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end
@implementation DataSource4
+ (DataSource4 *)sharedInstance
{
    static dispatch_once_t  onceToken;
    static DataSource4 * sSharedInstance;
    
    dispatch_once(&onceToken, ^{
        sSharedInstance = [[DataSource4 alloc] init];
    });
    return sSharedInstance;
}

// returns the URL to the application's Documents directory
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (id)init
{
    self = [super init];
    if (self != nil)
    {
        NSURL *dataFileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SavedData4"];
        if ([[NSFileManager defaultManager] fileExistsAtPath:[dataFileURL path]])
        {
            // saved file exists, load it's content from that path
            // note: unarchiveObjectWithFile returns an immutable array, we need to make it mutable
            //
            _dataArray = [[NSKeyedUnarchiver unarchiveObjectWithFile:[dataFileURL path]] mutableCopy];
        }
        else
        {
            _dataArray = [[NSMutableArray alloc] init];
        }
    }
    return self;
}

- (NSInteger)count
{
    return self.dataArray.count;
}

- (void)addItem:(Item *)item
{
    [self.dataArray addObject:item];
}

- (Item *)itemAtIndex:(NSInteger)index
{
    return [self.dataArray objectAtIndex:index];
}

- (void)removeItemAtIndex:(NSInteger)index
{
    [self.dataArray removeObjectAtIndex:index];
}

- (void)insertItem:(Item *)item atIndex:(NSInteger)index;
{
    [self.dataArray insertObject:item atIndex:index];
}

- (void)replaceItemAtIndex:(NSInteger)index withObject:(Item *)item
{
    [self.dataArray replaceObjectAtIndex:index withObject:item];
}

- (Item *)itemWithIdentifier:(NSString *)identifier
{
    return [self.dataArray objectAtIndex:[self.dataArray indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        *stop = [[obj identifier] isEqual:identifier];
        return *stop;
    }]];
}

- (NSIndexPath *)indexPathForItem:(Item *)item
{
    return [NSIndexPath indexPathForRow:[self.dataArray indexOfObject:item] inSection:0];
}

- (void)save
{
    NSURL *dataFileURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"SavedData4"];
    [NSKeyedArchiver archiveRootObject:self.dataArray toFile:[dataFileURL path]];
}

@end
