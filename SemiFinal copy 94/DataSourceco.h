//
//  DataSourceco.h
//  xXx
//
//  Created by kuku kay on 10/26/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSourceco : NSObject

- (NSInteger) numberOfItemsInSection:(NSInteger)section;
- (NSString *) identifierForIndexPath:(NSIndexPath *)indexPath;
- (NSString *) titleForIdentifier:(NSString *)identifier;
- (UIImage *) thumbnailForIdentifier:(NSString *)identifier;
- (UIImage *) imageForIdentifier:(NSString *)identifier;


@end
