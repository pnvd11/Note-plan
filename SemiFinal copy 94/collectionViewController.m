//
//  collectionViewController.m
//  xXx
//
//  Created by kuku kay on 10/26/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//

#import "collectionViewController.h"
#import "Cell.h"

#import "MyTableViewController.h"
#import "LogoMenuViewController.h"

#import "picViewController.h"

NSString *kCellID = @"cocellID";

@implementation collectionViewController
@synthesize dataSourceco;
@synthesize resetdata1 = _resetdata1;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setClearsSelectionOnViewWillAppear:NO];
    self.dataSourceco = [[DataSourceco alloc] init];
}


- (void) adjustContentInsetForLegacy {
    self.collectionView.contentInset = UIEdgeInsetsMake(64.0, 0.0, 0.0, 0.0);
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSArray *selectedItems = [self.collectionView indexPathsForSelectedItems];
    if ([selectedItems count]) {
        [UIView animateWithDuration:2 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             [self.collectionView deselectItemAtIndexPath:[selectedItems objectAtIndex:0] animated:YES];
                         }
                         completion:nil];
    }
    
    
}

 
 
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section; {
    return [self.dataSourceco numberOfItemsInSection:section];
   }

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath; {
    Cell *cell = [cv dequeueReusableCellWithReuseIdentifier:kCellID forIndexPath:indexPath];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        cell.label.textColor = [UIColor grayColor];
        cell.label.textAlignment = NSTextAlignmentCenter;
    }
    
    NSString *imageIdentifier = [self.dataSourceco identifierForIndexPath:indexPath];
    NSString *text = [self.dataSourceco titleForIdentifier:imageIdentifier];
    cell.label.text = text;
    cell.image.image = [self.dataSourceco
                        thumbnailForIdentifier:imageIdentifier];
    
  
        
        UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPresses:)];
        cell.longPressRecognizer = longPressRecognizer;
    
    
    return cell;
}



#pragma mark - Misc

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetailco"])
    {
        NSIndexPath *tappedCellIndexPath = [self.collectionView indexPathForCell:sender];
        
        MyTableViewController *destination = (MyTableViewController *)segue.destinationViewController;
        
        destination.z = tappedCellIndexPath.item;
        destination.resetdata2 = self.resetdata1;
        // NSLog(@"bool2co: %hhd", destination.resetdata2);
        
        self.resetdata1 = FALSE;
       // NSLog(@"%i",destination.z);
    }
}


-(void)handleLongPresses:(UILongPressGestureRecognizer *)longPressRecognizer {
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        
        NSIndexPath *pressedIndexPath = [self.collectionView indexPathForItemAtPoint:[longPressRecognizer locationInView:self.collectionView]];
        [self becomeFirstResponder];
        
        if (pressedIndexPath && (pressedIndexPath.row != NSNotFound)) {
        
        picViewController *pi = [ self.storyboard instantiateViewControllerWithIdentifier:@"picViewController"];
            
            pi.ino = pressedIndexPath.item;
           // NSLog(@"ino:%i",pi.ino);
        
        [self.navigationController pushViewController:pi animated:YES];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
