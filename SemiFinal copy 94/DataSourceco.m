//
//  DataSourceco.m
//  xXx
//
//  Created by kuku kay on 10/26/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "DataSourceco.h"

@interface DataSourceco ()

@property (nonatomic) NSDictionary *data;

@end

@implementation DataSourceco

- (instancetype) init {
    self = [super init];
    if (self) {
        NSURL *dataURL = [[NSBundle mainBundle] URLForResource:@"Data" withExtension:@"plist"];
        self.data = [NSDictionary dictionaryWithContentsOfURL:dataURL];
    }
    return self;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section {
    return 49;
}

- (NSString *)identifierForIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"%ld", (long)indexPath.row];
}

- (NSString *)titleForIdentifier:(NSString *)identifier {
    NSString *title = identifier ? [self.data objectForKey:identifier] : nil;
    if (title == nil) {
        title = @"Image";
    }
    return title;
}

- (UIImage *)thumbnailForIdentifier:(NSString *)identifier {
    if (identifier == nil) {
        return nil;
    }
    NSString *thumbnailName = [NSString stringWithFormat:@"%@.JPG", identifier];
    return [UIImage imageNamed:thumbnailName];
}

- (UIImage *)imageForIdentifier:(NSString *)identifier {
    if (identifier == nil) {
        return nil;
    }
    NSString *imageName = [NSString stringWithFormat:@"%@_full", identifier];
    NSString *pathToImage = [[NSBundle mainBundle] pathForResource:imageName ofType:@"JPG"];
    UIImage *image = [[UIImage alloc] initWithContentsOfFile:pathToImage];
    return image;
}

@end
