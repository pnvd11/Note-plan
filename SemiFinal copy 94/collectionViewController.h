//
//  collectionViewController.h
//  xXx
//
//  Created by kuku kay on 10/26/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataSourceco.h"
@interface collectionViewController : UICollectionViewController {
    BOOL _resetdata1;
}

@property (nonatomic, strong) DataSourceco *dataSourceco;
@property(nonatomic) BOOL resetdata1;

-(void) adjustContentInsetForLegacy;

@end
