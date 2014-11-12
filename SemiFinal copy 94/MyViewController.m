//
//  MyViewController.m
//  xXx
//
//  Created by kuku kay on 10/27/13.
//  Copyright (c) 2013 kuku kay. All rights reserved.
//
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

#import "MyViewController.h"
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



static NSString *kUnsavedItemKey = @"unsavedItemKey";

#ifdef MANUALLY_CREATE_VC_FOR_RESTORATION
@interface MyViewController () <UIViewControllerRestoration>
#else
@interface MyViewController ()

#endif

@property (nonatomic, weak) IBOutlet UINavigationBar *navigationBar;

// note that the UITextField and UITextView have restoration identifiers in the storyboard,
// which will help save their selection and scroll position
//
@property (nonatomic, weak) IBOutlet UITextField *editField;
@property (nonatomic, weak) IBOutlet UITextView *textView;
@property (nonatomic, weak) IBOutlet UITextField *editname;
@property (nonatomic, weak) IBOutlet UITextField *editname1;
@property (nonatomic, weak) IBOutlet UITextField *editname2;
@property (nonatomic, weak) IBOutlet UITextField *editname3;
@property (nonatomic, weak) IBOutlet UITextField *editname4;
@property (nonatomic, weak) IBOutlet UITextField *editname5;
@property (nonatomic, weak) IBOutlet UITextField *editname6;

@property (nonatomic, weak) IBOutlet UIBarButtonItem *saveButton;
@property (nonatomic, weak) IBOutlet UIBarButtonItem *cancelButton;

@property(nonatomic,weak) IBOutlet UILabel *start;
@property (nonatomic, weak) IBOutlet UIButton *plusbt;
@property (nonatomic, weak) IBOutlet UIButton *minusbt;
@property (nonatomic, weak) IBOutlet UILabel *hour1;
@property (nonatomic, weak) IBOutlet UILabel *mins1;
@property (nonatomic, weak) IBOutlet UIButton *plusbt1;
@property (nonatomic, weak) IBOutlet UIButton *minusbt1;

@property(nonatomic,weak) IBOutlet UILabel *end;
@property (nonatomic, weak) IBOutlet UIButton *plusbt2;
@property (nonatomic, weak) IBOutlet UIButton *minusbt2;
@property (nonatomic, weak) IBOutlet UILabel *hour2;
@property (nonatomic, weak) IBOutlet UILabel *mins2;
@property (nonatomic, weak) IBOutlet UIButton *plusbt3;
@property (nonatomic, weak) IBOutlet UIButton *minusbt3;



@end

@implementation MyViewController
@synthesize w=_w, x=_x, h1, h1down, m1, m1down, h2, hdown2, m2, mdown2;

- (void)awakeFromNib
{
    // note: usually we set the restoration identifier in the storyboard, but if you want
    // to do it in code, do it here
    //
#ifdef MANUALLY_CREATE_VC_FOR_RESTORATION
    self.restorationClass = [self class];
#endif
}

- (void)setupWithItem
{
    if (self.item)
    {
        
        self.editField.text = self.item.title;
        self.textView.text = self.item.notes;
        self.editname.text = self.item.name;
        self.editname1.text = self.item.name1;
        self.editname2.text = self.item.name2;
        self.editname3.text = self.item.name3;
        self.editname4.text = self.item.name4;
        self.editname5.text = self.item.name5;
        self.editname6.text = self.item.name6;
        
        self.navigationBar.topItem.title = self.item.title;
        //NSString * t =[self.editField.text substringWithRange:NSMakeRange(0, 4)];
        
        
        //if ([t isEqual: @"Week"]) {
            
        //    self.textView.hidden = YES;
        //}
        //else {
            if ([self.editField.text isEqual:@"Note"]) {
                
                //self.editField.hidden = YES;
                //self.editField.frame = CGRectMake(20, 50, 79, 30);
                self.editname.hidden = YES;
                self.editname1.hidden = YES;
                self.editname2.hidden = YES;
                self.editname3.hidden = YES;
                self.editname4.hidden = YES;
                self.editname5.hidden = YES;
                self.editname6.hidden = YES;
                
                self.start.hidden = YES;
                self.hour1.hidden = YES;
                self.plusbt.hidden = YES;
                self.minusbt.hidden = YES;
                self.plusbt1.hidden = YES;
                self.minusbt1.hidden = YES;
                self.mins1.hidden = YES;
                
                self.end.hidden = YES;
                self.hour2.hidden = YES;
                self.plusbt2.hidden = YES;
                self.minusbt2.hidden = YES;
                self.plusbt3.hidden = YES;
                self.minusbt3.hidden = YES;
                self.mins2.hidden = YES;
            }
            else {
                if ([self.editField.text isEqual:@"Week 1:"] || [self.editField.text isEqual:@"Week 2:"] || [self.editField.text isEqual:@"Week 3:"] || [self.editField.text isEqual:@"Week 4:"] ||[self.editField.text isEqual:@"Week 5:"]) {
                    self.editField.hidden = YES;
                    self.textView.hidden = YES;
                    
                    self.start.hidden = YES;
                    self.hour1.hidden = YES;
                    self.plusbt.hidden = YES;
                    self.minusbt.hidden = YES;
                    self.plusbt1.hidden = YES;
                    self.minusbt1.hidden = YES;
                    self.mins1.hidden = YES;
                    
                    self.end.hidden = YES;
                    self.hour2.hidden = YES;
                    self.plusbt2.hidden = YES;
                    self.minusbt2.hidden = YES;
                    self.plusbt3.hidden = YES;
                    self.minusbt3.hidden = YES;
                    self.mins2.hidden = YES;


                   
                }
                else {
               // self.editField.hidden = YES;
                    self.textView.hidden = YES;
                    
                    self.start.hidden = YES;
                    self.hour1.hidden = YES;
                    self.plusbt.hidden = YES;
                    self.minusbt.hidden = YES;
                    self.plusbt1.hidden = YES;
                    self.minusbt1.hidden = YES;
                    self.mins1.hidden = YES;
                    
                    self.end.hidden = YES;
                    self.hour2.hidden = YES;
                    self.plusbt2.hidden = YES;
                    self.minusbt2.hidden = YES;
                    self.plusbt3.hidden = YES;
                    self.minusbt3.hidden = YES;
                    self.mins2.hidden = YES;


                    
                }
            }
        }
    //}
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // listen for keyboard hide/show notifications so we can properly adjust the table's height
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname1];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname2];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname3];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname4];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname5];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(editFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.editname6];
    
    

    
    [self.textView becomeFirstResponder];  // we want the keyboard up when this view appears
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
	
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editField];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname1];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname2];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname3];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname4];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname5];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UITextFieldTextDidChangeNotification
                                                  object:self.editname6];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupWithItem];
    h1 = 0;
    m1 = 0;
    h2 = 0;
    m2 = 0;
}
 

// since we are the primary view controller, we need these 2 rotating methods:
- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskAllButUpsideDown;
}


#pragma mark - UIStateRestoration

// this is called when the app is suspended to the background
- (void)encodeRestorableStateWithCoder:(NSCoder *)coder
{
   // NSLog(@"MyViewController: encodeRestorableStateWithCoder");
    
    [super encodeRestorableStateWithCoder:coder];
    
    // save off any recent changes first since we are about to be suspended
    self.item.notes = self.textView.text;
    
    if ([self.hour1.text isEqual:@"hh"]) {

    //if (timeornot==FALSE) {
    self.item.title = self.editField.text;
    }
    else {
       self.item.title = [NSString stringWithFormat:@"%i:%i",h1,m1];
    }
    
    self.item.name = self.editname.text;
    self.item.name1 = self.editname1.text;
    self.item.name2 = self.editname2.text;
    self.item.name3 = self.editname3.text;
    self.item.name4 = self.editname4.text;
    self.item.name5 = self.editname5.text;
    self.item.name6 = self.editname6.text;
    
    NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.w];
    Class cl = NSClassFromString(terminal);
    [[cl sharedInstance] save];
    
    // encode only its UUID (identifier), and later we get back the item by searching for its UUID
    [coder encodeObject:self.item.identifier forKey:kUnsavedItemKey];
}

// this is called when the app is re-launched
- (void)decodeRestorableStateWithCoder:(NSCoder *)coder
{
    // important: don't affect our views just yet, we might not visible or we aren't the current
    // view controller, save off our ivars and restore our text view in viewWillAppear
    //
    NSLog(@"MyViewController: decodeRestorableStateWithCoder");
    
    [super decodeRestorableStateWithCoder:coder];
    
    // decode the edited item
    if ([coder containsValueForKey:kUnsavedItemKey])
    {
        // unarchive the UUID (identifier) and search for the item by its UUID
        NSString *identifier = [coder decodeObjectForKey:kUnsavedItemKey];
        
        NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.w];
        Class cl = NSClassFromString(terminal);
        self.item = [[cl sharedInstance] itemWithIdentifier:identifier];
        [self setupWithItem];
    }
}


#pragma mark - UIViewControllerRestoration

#ifdef MANUALLY_CREATE_VC_FOR_RESTORATION
+ (UIViewController *)viewControllerWithRestorationIdentifierPath:(NSArray *)identifierComponents
                                                            coder:(NSCoder *)coder
{
    NSLog(@"MyViewController: viewControllerWithRestorationIdentifierPath called for %@", identifierComponents);
    
    MyViewController *vc = nil;
    
    // get our main storyboard to obtain our view controller
    UIStoryboard *storyboard = [coder decodeObjectForKey:UIStateRestorationViewControllerStoryboardKey];
    if (storyboard)
    {
        vc = (MyViewController *)[storyboard instantiateViewControllerWithIdentifier:@"viewController"];
        vc.restorationIdentifier = [identifierComponents lastObject];
        vc.restorationClass = [MyViewController class];
    }
    return vc;
}
#endif


#pragma mark - Times

-(IBAction)hour1change {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
    [self.plusbt addGestureRecognizer: longPressRecognizer];
   
  
    
    if (h1<23) {
    h1 +=1;
    }
    else {h1 = 0;}
    
    h1down = h1;
    
    if (h1<10) {
        
    self.hour1.text = [NSString stringWithFormat:@"0%i:",h1];
    }
    else {
      self.hour1.text = [NSString stringWithFormat:@"%i:",h1];
        }
    
    
}

-(IBAction)hour1changedown {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress1:)];
    [self.minusbt addGestureRecognizer: longPressRecognizer];
    
    
    if (h1down > 0) {
        h1down  -=1;
    }
    else {h1down =23;}
    
    h1 = h1down;
    
    if (h1down < 10) {
        self.hour1.text = [NSString stringWithFormat:@"0%i:",h1down];
    }
    else {
        self.hour1.text = [NSString stringWithFormat:@"%i:",h1down];
    }
}

-(IBAction)mins1change {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress2:)];
    [self.plusbt1 addGestureRecognizer: longPressRecognizer];
    
    if (m1<59) {
    m1 +=1;
    }
    else { m1 = 0;}
    
    m1down = m1;
    
    if (m1<10) {
        
    self.mins1.text = [NSString stringWithFormat:@"0%i",m1];
    }
    else {
      self.mins1.text = [NSString stringWithFormat:@"%i",m1];
    }
}
-(IBAction)mins1changedown {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress3:)];
    [self.minusbt1 addGestureRecognizer: longPressRecognizer];
   
   
    if (m1down > 0) {
    m1down  -=1;
    }
    else {
        m1down = 59;
    }
   
    m1 = m1down;
    
    if (m1down<10) {
        
    self.mins1.text = [NSString stringWithFormat:@"0%i",m1down];
    }
    else {
    self.mins1.text = [NSString stringWithFormat:@"%i",m1down];
    }
    }


-(IBAction)hr2change {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress4:)];
    [self.plusbt2 addGestureRecognizer: longPressRecognizer];
    
   
    if (h2 <23) {
        h2 +=1;
    }
    else { h2 = 0;};
    
    hdown2 = h2;
    
    if (h2<10) {
        
    self.hour2.text = [NSString stringWithFormat:@"0%i:",h2];
    }
    else {
    self.hour2.text = [NSString stringWithFormat:@"%i:",h2];
    }
    
}
-(IBAction)hr2changedown {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress5:)];
    [self.minusbt2 addGestureRecognizer: longPressRecognizer];
    
  
    if (hdown2 >0) {
    hdown2  -=1;
    }
    else { hdown2 = 23;}
    
    h2 = hdown2;
    
    if (hdown2<10) {
    
    
    self.hour2.text = [NSString stringWithFormat:@"0%i:",hdown2];
    }
    else {
    self.hour2.text = [NSString stringWithFormat:@"%i:",hdown2];
    }
}

-(IBAction)m2change {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress6:)];
    [self.plusbt3 addGestureRecognizer: longPressRecognizer];
    
    if (m2 < 59) {
    m2 +=1;
    }
    else { m2 = 0;}
    
    mdown2 = m2;
    
    if (m2<10) {
    self.mins2.text = [NSString stringWithFormat:@"0%i",m2];
    }
    else {
    self.mins2.text = [NSString stringWithFormat:@"%i",m2];
    }
}
-(IBAction)m2changedown {
    UILongPressGestureRecognizer * longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress7:)];
    [self.minusbt3 addGestureRecognizer: longPressRecognizer];
    
    if (mdown2 > 0) {
    mdown2  -=1;
    }
    else { mdown2 =59;}
    
    m2 = mdown2;
   
    
    if (mdown2<10) {
        
    self.mins2.text = [NSString stringWithFormat:@"0%i",mdown2];
    }
    else {
    self.mins2.text = [NSString stringWithFormat:@"%i",mdown2];
    }
}

#pragma mark - Handling long presses

-(void)handleLongPress:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.
    
    // int j = h1;
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
      
        if (h1 <19) {

        h1 +=5;
        }
        else { h1 =0;}
        
        h1down =h1;
                
        if (h1<10) {
            
            self.hour1.text = [NSString stringWithFormat:@"0%i:",h1];
        }
        else {
            self.hour1.text = [NSString stringWithFormat:@"%i:",h1];
        }
        //}
    }
}

-(void)handleLongPress1:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
       
        if (h1down > 4) {
        h1down -=5;
        }
        else { h1down = 23;}
        
        h1 =h1down;
                
        if (h1down<10) {
            
            self.hour1.text = [NSString stringWithFormat:@"0%i:",h1down];
        }
        else {
            self.hour1.text = [NSString stringWithFormat:@"%i:",h1down];
        }
    }
}

-(void)handleLongPress2:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        if (m1 <55) {
    
        m1 +=5;
        }
        else { m1 = 0;}
        
        m1down =m1;
        
        
        if (m1<10) {
            
            self.mins1.text = [NSString stringWithFormat:@"0%i",m1];
        }
        else {
            self.mins1.text = [NSString stringWithFormat:@"%i",m1];
        }
        //}
    }
}

-(void)handleLongPress3:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        if (m1down >4) {
        
        m1down -=5;
        }
        else { m1down = 59;}
        m1 =m1down;
        
        
        if (m1down<10) {
            
            self.mins1.text = [NSString stringWithFormat:@"0%i",m1down];
        }
        else {
            self.mins1.text = [NSString stringWithFormat:@"%i",m1down];
        }
    }
}



-(void)handleLongPress4:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.

    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        if (h2 <19) {
        h2 +=5;}
        else { h2 = 0;}
        
        hdown2 =h2;
        
        
        if (h2<10) {
            
            self.hour2.text = [NSString stringWithFormat:@"0%i:",h2];
        }
        else {
            self.hour2.text = [NSString stringWithFormat:@"%i:",h2];
        }
        //}
    }
}

-(void)handleLongPress5:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.

    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        if (hdown2 > 4) {

        hdown2 -=5;
        }
        else {
            hdown2 = 23;
        }
        h2 =hdown2;
                
        if (hdown2<10) {
            
            self.hour2.text = [NSString stringWithFormat:@"0%i:",hdown2];
        }
        else {
            self.hour2.text = [NSString stringWithFormat:@"%i:",hdown2];
        }
    }
}

-(void)handleLongPress6:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.
    
    // int j = h1;
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
        
        if (m2 <55) {
        m2 +=5;
        }
        else { m2 = 0; }
        
        mdown2 =m2;
        
        
        if (m2<10) {
            
            self.mins2.text = [NSString stringWithFormat:@"0%i",m2];
        }
        else {
            self.mins2.text = [NSString stringWithFormat:@"%i",m2];
        }
        //}
    }
}

-(void)handleLongPress7:(UILongPressGestureRecognizer*)longPressRecognizer {
    // For the long press, the only state of interest is Began.
    
    if (longPressRecognizer.state == UIGestureRecognizerStateBegan) {
        [self becomeFirstResponder];
       
        if (mdown2 > 4) {
        mdown2 -=5;
        }
        else {
            mdown2 = 59;
        }
        m2 =mdown2;
                
        if (mdown2<10) {
            
            self.mins2.text = [NSString stringWithFormat:@"0%i",mdown2];
        }
        else {
            self.mins2.text = [NSString stringWithFormat:@"%i",mdown2];
        }
    }
}

#pragma mark- Acion
- (IBAction)saveAction:(id)sender
{
    // user tapped the Save button, save the contents
    //
    [self dismissViewControllerAnimated:YES completion:^{
        
        if ([self.hour1.text isEqual:@"hh:"]) {
           // NSLog(@"%@",self.hour1.text);
            
        self.item.title = self.editField.text;
        }
        else {
            
            NSString *hr3, *mns3, *hr4, *mns4;
            if (h1<10) {
                hr3 = [NSString stringWithFormat:@"0%i:",h1];
            }
            else {hr3 = [NSString stringWithFormat:@"%i:",h1];}
            
            if (m1<10) {
                mns3 = [NSString stringWithFormat:@"0%i",m1];
            }
            else {mns3 = [NSString stringWithFormat:@"%i",m1];}
            
            NSLog(@"aa:%@%@",hr3,mns3);
            
            if (IS_IPHONE_5) {
              if (h2<10) {
                hr4 = [NSString stringWithFormat:@"-0%i:",h2];
              }
              else {hr4 = [NSString stringWithFormat:@"-%i:",h2];}
            
              if (m2<10) {
                mns4 = [NSString stringWithFormat:@"0%i",m2];
              }
              else {mns4 = [NSString stringWithFormat:@"%i",m2];}
            
             //NSLog(@"bb:%@%@",hr4,mns4);
            
          
                if (h2> h1) {
                     self.item.title = [ NSString stringWithFormat:@"%@%@%@%@",hr3, mns3, hr4, mns4];
                }
                else {
                    
                    if ((h2 == h1) && (m2 > m1)) {
                    self.item.title = [ NSString stringWithFormat:@"%@%@%@%@",hr3, mns3, hr4, mns4];

                         }
                    else {
                    self.item.title = [ NSString stringWithFormat:@"%@%@",hr3,mns3];
                  }
                }
            }
            else { self.item.title = [ NSString stringWithFormat:@"%@%@",hr3,mns3];}
            
            }
        
        
        // this reason why data input from myviewcontroller not save to uitableview// self.editname.text = self.item.name;
        self.item.notes = self.textView.text;
        self.item.name = self.editname.text;
        self.item.name1 = self.editname1.text;
        self.item.name2 = self.editname2.text;
        self.item.name3 = self.editname3.text;
        self.item.name4 = self.editname4.text;
        self.item.name5 = self.editname5.text;
        self.item.name6 = self.editname6.text;
        
        [self.delegate editHasEnded:self withItem:self.item];
    }];
    
    //timeornot =FALSE;
    
    //Notification.
    
    if (!([self.hour1.text isEqual:@"hh"])) {
     
        
    // Determine today in which week of this month or next month.
    NSDate *today = [ NSDate date];
       // NSLog(@"today:%@", today);
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components =
    [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                           NSDayCalendarUnit)|NSWeekdayCalendarUnit|NSHourCalendarUnit|NSMinuteCalendarUnit fromDate: today];
    
    // first sunday of month contains this week.
    NSDateComponents *components1 = [[NSDateComponents alloc] init];
    [components1 setDay:1];
    int i = self.w / 4 +1;
    [components1 setMonth:i];
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
    
        
        //Chk w5.
        BOOL q = FALSE;
        BOOL r = FALSE;
        
        if ((self.w % 4)==3) {
            NSDate *sundayofweek4 = [sundayOfWeek dateByAddingTimeInterval:28*d];
            NSDateComponents *com3 = [gregorian components:(NSDayCalendarUnit) fromDate: sundayofweek4];
            
            int thismonth = self.w / 4 +1;

            if ((thismonth ==4)||(thismonth==6)||(i==9)||(thismonth==11)) {
                if ((com3.day==23) || (com3.day==22)) {
                    q = TRUE;
                }
            }
            
            if ((thismonth ==1)||(thismonth==3)||(i==5)||(thismonth==7)||(thismonth==8)||(thismonth==10)||(thismonth==12)) {
                if ((com3.day ==24) || (com3.day =23) ||(com3.day==22)){
                    q = TRUE;
                }
            }
            
            if ((components.year % 100)== 0) {
                
                if (components.year % 4 ==0) {
                    
                    
                    if ((thismonth==2) && (com3.day==22)) {
                        q = TRUE;
                    }
                }
            }
            else if ((components.year % 4) ==0) {
                if ((thismonth==2) &&(com3.day==22)) {
                    q = TRUE;
                }
            }
            
            
        }
        
       
        
        if (q==TRUE) {
            NSString *terminal = [NSString stringWithFormat:@"DataSource%i",self.w];
            Class cl = NSClassFromString(terminal);
            int a = [[cl sharedInstance] count];
            int weekrow = 0;
            for (int b=0; b<a; b++) {
                if ([[[[cl sharedInstance] itemAtIndex:b] title] isEqual:@"Week 5:"]) {
                    weekrow = b;
                }
            }
            if ((weekrow != 0) && (self.x >weekrow)) {
                r = TRUE;
            }
            
        }
       // NSLog(@"%hhd",r);
        
        
        
        int ee = self.w % 4;
        
        UIApplication* app = [UIApplication sharedApplication];
        UILocalNotification* notifyAlarm = [[UILocalNotification alloc] init];
        
        static NSDateFormatter *dateFormatter = nil;
        if (dateFormatter == nil) {
            dateFormatter = [[NSDateFormatter alloc] init];
            
            NSString *dateFormat = [NSDateFormatter dateFormatFromTemplate:@"MMMdhhmm" options:0 locale:[NSLocale currentLocale]];
            [dateFormatter setDateFormat:dateFormat];
            
        }
        
        if (![self.editname.text isEqual:@""]) {
            NSDate * fireDate;
            
            if (r==FALSE) {
            fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+1)*d];
            }
            else {
            fireDate = [sundayOfWeek dateByAddingTimeInterval:29*d];
            }
        
            
            
           
                NSDateComponents *components2 =
                [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                       NSDayCalendarUnit) fromDate: fireDate];
                [components2 setHour:self.h1];
                [components2 setMinute:self.m1];
               // NSLog(@"%i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
                
                NSDate *fireDate2 = [gregorian dateFromComponents:components2];
                
            
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)))  {
                
                if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                    
                    notifyAlarm.fireDate = fireDate2;
                   // NSLog(@"%@",notifyAlarm.fireDate);
                    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    notifyAlarm.repeatInterval = 0;
                    notifyAlarm.soundName = @"Submarine.aiff";
                    
                    notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname.text, [dateFormatter stringFromDate:fireDate2]];
                    
                   // NSLog(@"%@",notifyAlarm.alertBody);
                    
                    
                    notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                    [app scheduleLocalNotification:notifyAlarm];
                    
                    [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
                }
            }
        }
        
        if (![self.editname1.text isEqual:@""]) {
            
            NSDate * fireDate;
            
            if (r==FALSE) {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+2)*d];
            }
            else {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:30*d];
            }
            
            
            
            
           
                NSDateComponents *components2 =
                [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                       NSDayCalendarUnit) fromDate: fireDate];
                [components2 setHour:self.h1];
                [components2 setMinute:self.m1];
               // NSLog(@"%i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
                
                NSDate *fireDate2 = [gregorian dateFromComponents:components2];
                
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)) )  {
                
                if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                    
                
                    notifyAlarm.fireDate = fireDate2;
                   // NSLog(@"%@",notifyAlarm.fireDate);
                    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    notifyAlarm.repeatInterval = 0;
                    notifyAlarm.soundName = @"Submarine.aiff";
                    
                    notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname1.text, [dateFormatter stringFromDate:fireDate2]];
                    
                   // NSLog(@"%@",notifyAlarm.alertBody);
                    
                    
                    notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                    [app scheduleLocalNotification:notifyAlarm];
                    
                    [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
                }
            }
        }
        
        if (![self.editname2.text isEqual:@""]) {
            
            NSDate * fireDate;
            
            
            if (r==FALSE) {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+3)*d];
            }
            else {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:31*d];
            }
            
            
            
            //if (fireDate > today) {
                NSDateComponents *components2 =
                [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                       NSDayCalendarUnit) fromDate: fireDate];
                [components2 setHour:self.h1];
                [components2 setMinute:self.m1];
               // NSLog(@"%i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
                
                NSDate *fireDate2 = [gregorian dateFromComponents:components2];
                
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)) )  {
                
            if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                
                    notifyAlarm.fireDate = fireDate2;
                   // NSLog(@"%@",notifyAlarm.fireDate);
                    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    notifyAlarm.repeatInterval = 0;
                    notifyAlarm.soundName = @"Submarine.aiff";
                    
                    notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname2.text, [dateFormatter stringFromDate:fireDate2]];
                    
                   // NSLog(@"%@",notifyAlarm.alertBody);
                    
                    
                    notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                    [app scheduleLocalNotification:notifyAlarm];
                    
                    [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
                }
            }
        }
        
        if (![self.editname3.text isEqual:@""]) {
            NSDate * fireDate;
            
          
            if (r==FALSE) {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+4)*d];
            }
            else {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:32*d];
            }
            
            
            NSDateComponents *components2 =
            [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                   NSDayCalendarUnit) fromDate: fireDate];
            [components2 setHour:self.h1];
            [components2 setMinute:self.m1];
           // NSLog(@"%i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
            
            NSDate *fireDate2 = [gregorian dateFromComponents:components2];
            
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)))  {
                
                if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                    
                notifyAlarm.fireDate = fireDate2;
               // NSLog(@"%@",notifyAlarm.fireDate);
                notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                notifyAlarm.repeatInterval = 0;
                notifyAlarm.soundName = @"Submarine.aiff";
                
                notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname3.text, [dateFormatter stringFromDate:fireDate2]];
               
              //  NSLog(@"%@",notifyAlarm.alertBody);
                
                
                notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                [app scheduleLocalNotification:notifyAlarm];
                
                [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
              
            }
            }
            }
    
        if (![self.editname4.text isEqual:@""]) {
            
            NSDate * fireDate;
            
            if (r==FALSE) {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+5)*d];
            }
            else {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:33*d];
            }
            
            
            
                NSDateComponents *components2 =
                [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                       NSDayCalendarUnit) fromDate: fireDate];
                [components2 setHour:self.h1];
                [components2 setMinute:self.m1];
               // NSLog(@"%i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
                
                NSDate *fireDate2 = [gregorian dateFromComponents:components2];
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)))  {
                
                if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                    
                    notifyAlarm.fireDate = fireDate2;
                   // NSLog(@"%@",notifyAlarm.fireDate);
                    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    notifyAlarm.repeatInterval = 0;
                    notifyAlarm.soundName = @"Submarine.aiff";
                    
                    notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname4.text, [dateFormatter stringFromDate:fireDate2]];
                    
                  //  NSLog(@"%@",notifyAlarm.alertBody);
                    
                    
                    notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                    [app scheduleLocalNotification:notifyAlarm];
                    
                    [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
                }
            }
        }
        
        if (![self.editname5.text isEqual:@""]) {
            
            NSDate * fireDate;
            
           
            if (r==FALSE) {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+6)*d];
            }
            else {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:34*d];
            }
            
            
                NSDateComponents *components2 =
                [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                       NSDayCalendarUnit) fromDate: fireDate];
                [components2 setHour:self.h1];
                [components2 setMinute:self.m1];
              //  NSLog(@"%i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
                
                NSDate *fireDate2 = [gregorian dateFromComponents:components2];
            
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)))  {
                
                if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                    
                    notifyAlarm.fireDate = fireDate2;
                  //  NSLog(@"%@",notifyAlarm.fireDate);
                    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    notifyAlarm.repeatInterval = 0;
                    notifyAlarm.soundName = @"Submarine.aiff";
                    
                    notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname5.text, [dateFormatter stringFromDate:fireDate2]];
                    
                  //  NSLog(@"%@",notifyAlarm.alertBody);
                    
                    
                    notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                    [app scheduleLocalNotification:notifyAlarm];
                    
                    [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
                }
            }
        }
    
        if (![self.editname6.text isEqual:@""]) {
            
            NSDate * fireDate;
           
            if (r==FALSE) {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:(ee*7+7)*d];
            }
            else {
                fireDate = [sundayOfWeek dateByAddingTimeInterval:35*d];
            }
            
           // NSLog(@"firedate:%@", fireDate);
            
            
                NSDateComponents *components2 =
                [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
                                       NSDayCalendarUnit) fromDate: fireDate];
                [components2 setHour:self.h1];
                [components2 setMinute:self.m1];
               // NSLog(@"test: %i-%i-%i-%i-%i", components2.year, components2.month, components2.day, components2.hour,components2.minute);
                
                NSDate *fireDate2 = [gregorian dateFromComponents:components2];
                
            
            
            if ((!(components2.year < components.year))&& (!(components2.month < components.month)) && (!(components2.day < components.day)) )  {
                
                if ((components2.hour >components.hour) ||((components2.hour ==components.hour)&&(!(components2.minute<components.minute)))) {
                    
                    notifyAlarm.fireDate = fireDate2;
                  //  NSLog(@"%@",notifyAlarm.fireDate);
                    notifyAlarm.timeZone = [NSTimeZone defaultTimeZone];
                    notifyAlarm.repeatInterval = 0;
                    notifyAlarm.soundName = @"Submarine.aiff";
                    
                notifyAlarm.alertBody = [NSString stringWithFormat:@"%@: %@", self.editname6.text, [dateFormatter stringFromDate:fireDate2]];
                    
                  //  NSLog(@"test:%@",notifyAlarm.alertBody);
                    
                    
                    notifyAlarm.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
                    [app scheduleLocalNotification:notifyAlarm];
                    
                    [[UIApplication sharedApplication] scheduleLocalNotification:notifyAlarm];
                }
            }
        }
    
    
    }
    
}

- (IBAction)cancelAction:(id)sender
{
    // user tapped the Cancel button, don't save
    //
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Keyboard support

- (void)adjustViewForKeyboardReveal:(BOOL)showKeyboard notificationInfo:(NSDictionary *)notificationInfo
{
    // the keyboard is showing so resize the text view's height
	CGRect keyboardRect = [[notificationInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration =
    [[notificationInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.textView.frame;
    
    // note the keyboard rect's width and height are reversed in landscape
    NSInteger adjustDelta =
    UIInterfaceOrientationIsPortrait(self.interfaceOrientation) ? CGRectGetHeight(keyboardRect) : keyboardRect.size.width;
    
    if (showKeyboard)
        frame.size.height -= adjustDelta;
    else
        frame.size.height += adjustDelta;
    
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    
    [UIView commitAnimations];
}

- (void)keyboardWillShow:(NSNotification *)aNotification
{
	[self adjustViewForKeyboardReveal:YES notificationInfo:[aNotification userInfo]];
}

- (void)keyboardWillHide:(NSNotification *)aNotification
{
    //[self adjustViewForKeyboardReveal:NO notificationInfo:[aNotification userInfo]];
    [self adjustViewForKeyboardReveal:YES notificationInfo:[aNotification userInfo]];
}

- (void)editFieldChanged:(NSNotification *)notif
{
    // disable the Save button if there is no text for the title
    UITextField *textField = [notif object];
    self.saveButton.enabled = textField.text.length > 0;
    if (([textField.text isEqual:@"Time"]) ||([textField.text isEqual:@"Time "])){
        self.start.hidden = NO;
        self.hour1.hidden = NO;
        self.plusbt.hidden = NO;
        self.minusbt.hidden = NO;
        self.plusbt1.hidden = NO;
        self.minusbt1.hidden = NO;
        self.mins1.hidden = NO;
       
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0) {
        self.end.hidden = YES;
        self.hour2.hidden = YES;
        self.plusbt2.hidden = YES;
        self.minusbt2.hidden = YES;
        self.plusbt3.hidden = YES;
        self.minusbt3.hidden = YES;
        self.mins2.hidden = YES;
        }
        else {
            self.end.hidden = NO;
            self.hour2.hidden = NO;
            self.plusbt2.hidden = NO;
            self.minusbt2.hidden = NO;
            self.plusbt3.hidden = NO;
            self.minusbt3.hidden = NO;
            self.mins2.hidden = NO;
        }

        self.editname.hidden = NO;
        self.editname1.hidden = NO;
        self.editname2.hidden = NO;
        self.editname3.hidden = NO;
        self.editname4.hidden = NO;
        self.editname5.hidden = NO;
        self.editname6.hidden = NO;
        
        self.textView.hidden = YES;
    }
    else {
          if (([textField.text isEqual:@"Note"]) ||([textField.text isEqual:@"Note "])) {
           self.editname.hidden = YES;
           self.editname1.hidden = YES;
           self.editname2.hidden = YES;
           self.editname3.hidden = YES;
           self.editname4.hidden = YES;
           self.editname5.hidden = YES;
           self.editname6.hidden = YES;
           
              self.start.hidden = YES;
              self.hour1.hidden = YES;
              self.plusbt.hidden = YES;
              self.minusbt.hidden = YES;
              self.plusbt1.hidden = YES;
              self.minusbt1.hidden = YES;
              self.mins1.hidden = YES;
              
              self.end.hidden = YES;
              self.hour2.hidden = YES;
              self.plusbt2.hidden = YES;
              self.minusbt2.hidden = YES;
              self.plusbt3.hidden = YES;
              self.minusbt3.hidden = YES;
              self.mins2.hidden = YES;

   
           self.textView.hidden =NO;
          }
          else {
              self.start.hidden = YES;
              self.hour1.hidden = YES;
              self.plusbt.hidden = YES;
              self.minusbt.hidden = YES;
              self.plusbt1.hidden = YES;
              self.minusbt1.hidden = YES;
              self.mins1.hidden = YES;
              
              self.end.hidden = YES;
              self.hour2.hidden = YES;
              self.plusbt2.hidden = YES;
              self.minusbt2.hidden = YES;
              self.plusbt3.hidden = YES;
              self.minusbt3.hidden = YES;
              self.mins2.hidden = YES;


              self.editname.hidden = NO;
              self.editname1.hidden = NO;
              self.editname2.hidden = NO;
              self.editname3.hidden = NO;
              self.editname4.hidden = NO;
              self.editname5.hidden = NO;
              self.editname6.hidden = NO;
             
              self.textView.hidden = YES;
          }
    
    }
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
