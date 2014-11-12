//
//  MyTableViewController.m
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#import "MyTableViewController.h"
#import "DataSource0.h" 
#import "DataSource1.h"
#import "DataSource2.h"
#import "DataSource3.h"
#import "DataSource4.h"
#import "DataSource5.h"
#import "DataSource6.h"
#import "DataSource7.h"
#import "DataSource8.h"
#import "DataSource9.h"
#import "DataSource10.h"
#import "DataSource11.h"
#import "DataSource12.h"
#import "DataSource13.h"
#import "DataSource14.h"
#import "DataSource15.h"
#import "DataSource16.h"
#import "DataSource17.h"
#import "DataSource18.h"
#import "DataSource19.h"
#import "DataSource20.h"
#import "DataSource21.h"
#import "DataSource22.h"
#import "DataSource23.h"
#import "DataSource24.h"
#import "DataSource25.h"
#import "DataSource26.h"
#import "DataSource27.h"
#import "DataSource28.h"
#import "DataSource29.h"
#import "DataSource30.h"
#import "DataSource31.h"
#import "DataSource32.h"
#import "DataSource33.h"
#import "DataSource34.h"
#import "DataSource35.h"
#import "DataSource36.h"
#import "DataSource37.h"
#import "DataSource38.h"
#import "DataSource39.h"
#import "DataSource40.h"
#import "DataSource41.h"
#import "DataSource42.h"
#import "DataSource43.h"
#import "DataSource44.h"
#import "DataSource45.h"
#import "DataSource46.h"
#import "DataSource47.h"
#import "DataSource48.h"
//#import "LogoMenuViewController.h"

static NSString *kUnsavedEditStateKey = @"unsavedEditStateKey";

#ifdef MANUALLY_CREATE_VC_FOR_RESTORATION
@interface MyTableViewController () <UIViewControllerRestoration>
#else
@interface MyTableViewController () {
  

}
#endif

@property (nonatomic, weak) IBOutlet UIBarButtonItem *addButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *actionButton;

@end

@implementation MyTableViewController
@synthesize z= _z;
@synthesize resetdata2 =_resetdata2;


- (void)viewDidLoad
{
    [super viewDidLoad];

    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
    
    if (self.resetdata2 == TRUE) {
       // NSLog(@"bool2tableview: %hhd", self.resetdata2);
        for (int a = 0; a <49; a++) {
            NSString * b = [NSString stringWithFormat:@"DataSource%i",a];
            //NSLog(@"%@",b);
            
            Class deld = NSClassFromString(b);
            //NSLog(@"count:%i",[[deld sharedInstance] count]);
            for (int q=0; q<[[deld sharedInstance] count]; q++) {
            [[deld sharedInstance] removeItemAtIndex:q];
                
            }
          
        }
        
        [self.tableView reloadData];
        self.resetdata2 = FALSE;
    }
    
    
    if ([[cl sharedInstance] count] == 0)
    {
        // we don't have items stored yet, so create some default ones
        
       // if (!(self.z == 48)) {
            NSString * str = [NSString stringWithFormat:@"Week %i:", ((self.z % 4) +1)];
        [[cl sharedInstance]     addItem:[[Item alloc] initWithTitle:str notes:@"" name:@"Mon" name1:@"Tue" name2:@"Wed" name3:@"Thu" name4:@"Fri" name5:@"Sat" name6:@"Sun" ]];
        //}
     
        
        if (IS_IPHONE_5) {
            
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Target:" notes:@"" name:@"Alain" name1:@"Conf" name2:@"Office" name3:@"Meeting" name4:@"Lib" name5:@"Party" name6:@"Picnic"]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"04:00-09:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"09:00-11:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"12:00-14:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"15:00-17:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"18:00-21:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"22:00-01:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Note" notes:@"Note row." name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        }
        else {
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Target:" notes:@"" name:@"Alain" name1:@"Conf" name2:@"Office" name3:@"Meeting" name4:@"Lib" name5:@"Party" name6:@"Picnic"]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"04:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"09:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"12:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"15:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"18:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"22:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Note" notes:@"Note row." name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
        }
        
        
        // Add extra week when needed.
        if ((self.z %4) == 3) {
            //NSLog(@"%i", (self.z % 4));
            
            NSDate *today = [ NSDate date];
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSGregorianCalendar];
            
            NSDateComponents *components =
            [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                   NSDayCalendarUnit) fromDate: today];
            
            NSDateComponents *components1 = [[NSDateComponents alloc] init];
            [components1 setDay:1];
            int i = self.z / 4 +1;
            [components1 setMonth:i];
            [components1 setYear:components.year];
            [components1 setHour:9];
            NSDate *date = [gregorian dateFromComponents:components1];
            NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
            
            NSDate *sundayOfWk;
            NSTimeInterval g = 24*60*60;
            
            
            
            if ([weekdayComponents weekday] == 1) {
                
                sundayOfWk = [date dateByAddingTimeInterval:(-7*g)];
            }
            else {
                
                NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
                [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
                
                
                sundayOfWk = [gregorian dateByAddingComponents:componentsToSubtract toDate:date options:0];
            }
            
            
            
            static NSDateFormatter *dateFormatter = nil;
            if (dateFormatter == nil) {
                dateFormatter = [[NSDateFormatter alloc] init];
                NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"MMMd" options:0 locale:[NSLocale currentLocale]];
                [dateFormatter setDateFormat:dateFormat];
             }
            //NSTimeInterval g = 24*60*60;
            
            NSString *sun= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:28*g]];
            sun = [sun substringWithRange:NSMakeRange(4, ([sun length]-4))];
           // NSLog(@"sunday of week 4 of this month: %@",sun);
            BOOL  q = FALSE;
            
                
            if ((i ==4)||(i==6)||(i==9)||(i==11)) {
               if (([sun isEqual:@"23"]) || ([sun isEqual:@"22"])) {
                q = TRUE;
               }
            }
            
            if ((i ==1)||(i==3)||(i==5)||(i==7)||(i==8)||(i==10)||(i==12)) {
                if (([sun isEqual:@"24"]) || ([sun isEqual:@"23"]) ||([sun isEqual:@"22"])){
                    q = TRUE;
                }
            }
            
            
            
            if ((components.year % 100)== 0) {
                
                if (components.year % 4 ==0) {
                    
                
                if ((i==2) && ([sun isEqual:@"22"])) {
                    q = TRUE;
                }
                }
            }
            else if ((components.year % 4) ==0) {
                if ((i ==2) &&([sun isEqual:@"22"])) {
                    q = TRUE;
                }
              }
            
            
            
            if (q == TRUE) {
                
            NSString *mon = [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval: 29*g]];
            NSString *tue= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:30*g]];
            NSString *wed= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:31*g]];
            NSString *thu= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:32*g]];
            NSString *fri= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:33*g]];
            NSString *sat= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:34*g]];
            NSString *finalsun= [dateFormatter stringFromDate:[sundayOfWk dateByAddingTimeInterval:35*g]];
            
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Note" notes:@"This month has extra week. Please note Week 5 here." name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
            [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Week 5:" notes:@"" name:mon name1:tue name2:wed name3:thu name4:fri name5:sat name6:finalsun]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Target:" notes:@"" name:@"Alain" name1:@"Conf" name2:@"Office" name3:@"Meeting" name4:@"Lib" name5:@"Party" name6:@"Picnic"]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"04:00-09:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"09:00-11:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"12:00-14:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"15:00-17:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"18:00-21:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"22:00-01:00" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"Note" notes:@"Note row." name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
                
           }
        }
        
        
        [[cl sharedInstance] save];
    }

    
    
    
}

- (void)reloadTable
{
    [self.tableView reloadData];
}

- (IBAction)addButton:(id)sender
{
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
       if (IS_IPHONE_5) {
       [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"New Row" notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
    }
    else {
     [[cl sharedInstance] addItem:[[Item alloc] initWithTitle:@"New." notes:@"" name:@"" name1:@"" name2:@"" name3:@"" name4:@"" name5:@"" name6:@""]];
    }
    
    
    [[cl sharedInstance] save];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.tableView numberOfRowsInSection:0] inSection:0];
    
    [self.tableView beginUpdates];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}


- (IBAction)actionButton:(id)sender
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
   
    CGRect rect = CGRectMake(-10, -10, 568, 320);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([viewImage CGImage], rect);
    
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    
    CGImageRelease(imageRef);
    
    if (img) {
        UIActivityViewController *avc = [[UIActivityViewController alloc] initWithActivityItems:[NSArray arrayWithObject:img] applicationActivities:nil];
        avc.restorationIdentifier = @"Activity";
        [self presentViewController:avc animated:YES completion:nil];
    }
}

#pragma mark - UITableViewDelegate

- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;   // allow for deletion
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES; // all rows can be edited
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES; // all rows can be reordered
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    
    // disable the add button while in edit mode
    self.addButton.enabled = !self.tableView.editing;
    
    if (!editing)
    {
        // save any reordering or deletions
        NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
        Class cl = NSClassFromString(terminal);
        
        [[cl sharedInstance] save];
    }
}

// user deleted a table cell, so handle the deletion in our data source
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
        Class cl = NSClassFromString(terminal);
        
        [[cl sharedInstance] removeItemAtIndex:indexPath.row];
        
        // animate the deletion from the table
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

// user moved a table cell, so handle the reordering of our data source
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
    
    Item *itemToMove = [[cl sharedInstance] itemAtIndex:sourceIndexPath.row];
    [[cl sharedInstance] removeItemAtIndex:sourceIndexPath.row];
    [[cl sharedInstance] insertItem:itemToMove atIndex:destinationIndexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
       if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0){
        if (indexPath.row ==0) {
            
            NSDate *today = [ NSDate date];
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSGregorianCalendar];
            
            NSDateComponents *components =
            [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                   NSDayCalendarUnit) fromDate: today];
            
            NSDateComponents *components1 = [[NSDateComponents alloc] init];
            [components1 setDay:1];
            int i = self.z / 4 +1;
            [components1 setMonth:i];
            //NSLog(@"%i",i);
            [components1 setYear:components.year];
            NSDate *date = [gregorian dateFromComponents:components1];
            NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
           // NSLog(@"weekday of 1st of this month: %i",[weekdayComponents weekday]);
            
            NSDate *sundayOfWeek;
            NSTimeInterval d = 24*60*60;
            
            
            
            if ([weekdayComponents weekday] == 1) {
                
                sundayOfWeek = [date dateByAddingTimeInterval:(-7*d)];
            }
            else {
                
                NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
                [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
                
                sundayOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:date options:0];
            }
            
            static NSDateFormatter *dateFormatter = nil;
            if (dateFormatter == nil) {
                dateFormatter = [[NSDateFormatter alloc] init];
                
                NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"MMMd" options:0 locale:[NSLocale currentLocale]];
                [dateFormatter setDateFormat:dateFormat];
               
            }
            
            
            static NSString *kCellIdentifier = @"cellID";
            
            customTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
            int ee = self.z % 4;
            cell.editname.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+1)*d]];
            cell.editname.backgroundColor = [UIColor blueColor];
            cell.editname1.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+2)*d]];
            cell.editname1.backgroundColor = [UIColor cyanColor];
            
            cell.editname2.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+3)*d]];
            cell.editname2.backgroundColor = [UIColor blueColor];
            cell.editname3.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+4)*d]];
            cell.editname3.backgroundColor = [UIColor cyanColor];
            
            cell.editname4.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+5)*d]];
            cell.editname4.backgroundColor = [UIColor blueColor];
            cell.editname5.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7 +6)*d]];
            cell.editname5.backgroundColor = [UIColor cyanColor];
            
            cell.editname6.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+7)*d]];
            cell.editname6.backgroundColor = [UIColor blueColor];
            
            if (!(self.z == 48)) {
                cell.editField.text =[NSString stringWithFormat:@"W.%i",((self.z % 4) +1)];
            }
            else {
                NSDateComponents *yrComponents = [gregorian components:NSYearCalendarUnit fromDate:[sundayOfWeek dateByAddingTimeInterval:33*d]];
                cell.editField.text =[NSString stringWithFormat:@"%i",yrComponents.year];
            }
            cell.editField.backgroundColor = [UIColor blueColor];
            cell.textView.hidden = YES;
            cell.textView.backgroundColor = [UIColor blueColor];
        
            
        }
        
       

    }
    
    [self.tableView reloadData];
}


- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.tableView reloadData];
}

#pragma mark handling longpresses
-(void)handleLongPress:(UILongPressGestureRecognizer*)longPressRecognizer  {
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:[longPressRecognizer locationInView:self.tableView]];
        [self becomeFirstResponder];
        
        if (indexPath.row ==0) {
            
            NSDate *today = [ NSDate date];
            NSCalendar *gregorian = [[NSCalendar alloc]
                                     initWithCalendarIdentifier:NSGregorianCalendar];
            
            NSDateComponents *components =
            [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                   NSDayCalendarUnit) fromDate: today];
            
            NSDateComponents *components1 = [[NSDateComponents alloc] init];
            [components1 setDay:1];
            int i = self.z / 4 +1;
            [components1 setMonth:i];
            //NSLog(@"%i",i);
            [components1 setYear:components.year];
            NSDate *date = [gregorian dateFromComponents:components1];
            NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit fromDate:date];
            //NSLog(@"weekday of 1st of this month: %i",[weekdayComponents weekday]);
            
            NSDate *sundayOfWeek;
            NSTimeInterval d = 24*60*60;
            
            
            
            if ([weekdayComponents weekday] == 1) {
                
                sundayOfWeek = [date dateByAddingTimeInterval:(-7*d)];
            }
            else {
                
                NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
                [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
                
                sundayOfWeek = [gregorian dateByAddingComponents:componentsToSubtract toDate:date options:0];
            }
            
            static NSDateFormatter *dateFormatter = nil;
            if (dateFormatter == nil) {
                dateFormatter = [[NSDateFormatter alloc] init];
                
                NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"MMMd" options:0 locale:[NSLocale currentLocale]];
                [dateFormatter setDateFormat:dateFormat];
                //}
            }
            
            
            static NSString *kCellIdentifier = @"cellID";
            
            customTableCell *cell = [self.tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
            int ee = self.z % 4;
            cell.editname.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+1)*d]];
            cell.editname.backgroundColor = [UIColor blueColor];
            cell.editname1.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+2)*d]];
            cell.editname1.backgroundColor = [UIColor cyanColor];
            
            cell.editname2.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+3)*d]];
            cell.editname2.backgroundColor = [UIColor blueColor];
            cell.editname3.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+4)*d]];
            cell.editname3.backgroundColor = [UIColor cyanColor];
            
            cell.editname4.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+5)*d]];
            cell.editname4.backgroundColor = [UIColor blueColor];
            cell.editname5.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7 +6)*d]];
            cell.editname5.backgroundColor = [UIColor cyanColor];
            
            cell.editname6.text= [dateFormatter stringFromDate:[sundayOfWeek dateByAddingTimeInterval:(ee*7+7)*d]];
            cell.editname6.backgroundColor = [UIColor blueColor];
            
            if (!(self.z == 48)) {
                cell.editField.text =[NSString stringWithFormat:@"W.%i",((self.z % 4) +1)];
            }
            else {
                NSDateComponents *yrComponents = [gregorian components:NSYearCalendarUnit fromDate:[sundayOfWeek dateByAddingTimeInterval:33*d]];
                cell.editField.text =[NSString stringWithFormat:@"%i",yrComponents.year];
            }
            cell.editField.backgroundColor = [UIColor blueColor];
            cell.textView.hidden = YES;
            cell.textView.backgroundColor = [UIColor blueColor];
        }
        
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
    return [[cl sharedInstance] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *kCellIdentifier = @"cellID";
    
    customTableCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
    
    if ([[[[cl sharedInstance] itemAtIndex:indexPath.row]title] isEqual:@"Note"]) {
        cell.editname.hidden = YES;
        cell.editname1.hidden = YES;
        cell.editname2.hidden = YES;
        cell.editname3.hidden = YES;
        cell.editname4.hidden = YES;
        cell.editname5.hidden = YES;
        cell.editname6.hidden = YES;
        cell.textView.hidden = NO;
    }
    else {
        cell.textView.hidden = YES;
    }
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_async(concurrentQueue, ^{
        NSString *st1,*st2,*st3,*st4,*st5,*st6,*st7,*st8,*st9;
        st1 = [[[cl sharedInstance] itemAtIndex:indexPath.row] title];
        st2 = [[[cl sharedInstance] itemAtIndex:indexPath.row] name];
        st3= [[[cl sharedInstance] itemAtIndex:indexPath.row] name1];
        st4= [[[cl sharedInstance] itemAtIndex:indexPath.row] name2];
        st5 = [[[cl sharedInstance] itemAtIndex:indexPath.row] name3];
        st6 =[[[cl sharedInstance] itemAtIndex:indexPath.row] name4];
        st7 = [[[cl sharedInstance] itemAtIndex:indexPath.row] name5];
        st8 = [[[cl sharedInstance] itemAtIndex:indexPath.row] name6];
        st9 = [[[cl sharedInstance] itemAtIndex:indexPath.row] notes];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.editField.text = st1;
            cell.editname.text = st2;
            cell.editname1.text = st3;
            cell.editname1.backgroundColor = [UIColor cyanColor];
            cell.editname2.text = st4;
            cell.editname3.text = st5;
            cell.editname3.backgroundColor = [UIColor cyanColor];
            cell.editname4.text = st6;
            cell.editname5.text = st7;
            cell.editname5.backgroundColor = [UIColor cyanColor];
            cell.editname6.text = st8;
            cell.textView.text  = st9;
            
            
        });
    });
    
    // long presses gesturerecognizer.
    
    if (!([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0)) {
        
    
        UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        cell.longPressRecognizer = longPressRecognizer;
    }
    
    
    return cell;
    
}


#pragma mark - Misc

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        NSIndexPath *tappedCellIndexPath = [self.tableView indexPathForCell:sender];
        
        MyViewController *destinationVC = (MyViewController *)segue.destinationViewController;
        destinationVC.delegate = self;  // notify us when this note has been saved
        
        // here we just set the destintation view controller's backing object
        NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
        Class cl = NSClassFromString(terminal);
        Item *rowObj = [[cl sharedInstance] itemAtIndex:tappedCellIndexPath.row];
        destinationVC.item = rowObj;
        
       // destinationVC.w = &(_z);
        destinationVC.w = self.z;
        destinationVC.x = tappedCellIndexPath.row;
    }
}


#pragma mark - UIStateRestoration

#ifdef MANUALLY_CREATE_VC_FOR_RESTORATION
+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                                                            coder:(NSCoder *)coder
{
    MyTableViewController *vc = nil;
    
   // NSLog(@"MyTableViewController: viewControllerWithRestorationIdentifierPath");
    
    // get our main storyboard
    UIStoryboard *storyboard = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    if (storyboard)
    {
        vc = (MyTableViewController *)[storyboard instantiateViewControllerWithIdentifier:@"tableViewController"];
        vc.restorationIdentifier = [identifierComponents lastObject];
        vc.restorationClass = [MyTableViewController class];
    }
    return vc;
}
#endif

// this is called when the app is suspended to the background
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
   // NSLog(@"MyTableViewController: encodeRestorableStateWithCoder");
    
    [super encodeRestorableStateWithCoder:coder];
    
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
    [[cl sharedInstance] save];
    
    [coder encodeBool:[self.tableView isEditing] forKey:kUnsavedEditStateKey];
}

// this is called when the app is re-launched
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    // important: don't affect our views just yet, we might not visible or we aren't the current
    // view controller, save off our ivars and restore our text view in viewWillAppear
    //
   // NSLog(@"MyTableViewController: decodeRestorableStateWithCoder");
    
    [super decodeRestorableStateWithCoder:coder];
    
    self.tableView.editing = [coder decodeBoolForKey:kUnsavedEditStateKey];
    
    [self.tableView reloadData];
}


#pragma mark - UIDataSourceModelAssociation

// determine the identifier for the item at the given index path,
// note: if this method is not called, then you probably don't have the restore identifier
// set on your UITableView, or you have not adopted "UIDataSourceModelAssociation"
//
- (NSString *)modelIdentifierForElementAtIndexPath:(NSIndexPath *)path inView:(UIView *)view
{
   // NSLog(@"MyTableViewController: modelIdentifierForElementAtIndexPath");
    
    NSString *identifier = nil;
    
    if (path && view)
    {
        // return an identifier of the given NSIndexPath, in case next time the data source has changed
        NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
        Class cl = NSClassFromString(terminal);
        Item *item = [[cl sharedInstance] itemAtIndex:path.row];
        
        
        if (item != nil)
        {
            identifier = item.identifier;
        }
    }
    
    return identifier;
}

// during state restoration, "view" can call this method to locate objects that are not
// where they were expected to be.
//
- (NSIndexPath *)indexPathForElementWithModelIdentifier:(NSString *)identifier inView:(UIView *)view
{
   // NSLog(@"MyTableViewController: indexPathForElementWithModelIdentifier");
    
    NSIndexPath *indexPath = nil;
    
    if (identifier && view)
    {
        // come up with the appropriate object for the given identifier, in case the data
        // source has changed
        //
        
        NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
        Class cl = NSClassFromString(terminal);
        Item *item = [[cl sharedInstance] itemWithIdentifier:identifier];
        if (item)
        {
            indexPath = [[cl sharedInstance] indexPathForItem:item];
        }
    }
    
    return indexPath;
}


#pragma mark - MyViewControllerDelegate

// our detail view controller (MyViewController) is telling us it finished editing the items.
//
- (void)editHasEnded:(MyViewController *)viewController withItem:(Item *)item
{
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.z];
    Class cl = NSClassFromString(terminal);
    [[cl sharedInstance] save];
    
    NSIndexPath *indexPath = [[cl sharedInstance] indexPathForItem:item];
    if (indexPath != nil)
    {
        [self.tableView beginUpdates];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
        [self.tableView endUpdates];
    }
    
    [self.tableView reloadData];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
