pop over view 
==============================
- can only used in ipad. iphone does not allow
- total need two view controller, one is for rootviewcontroller, one is for viewcontroller to be popped over


rootviewcontroller
--------------------
        - (void)viewDidLoad
        {
            [super viewDidLoad];
     
        //see if this class exists on IOS runing the app
        Class popoverClass = NSClassFromString(@"UIPopoverController");
        
        if (popoverClass !=nil && UI_USER_INTERFACE_IDIOM() ==UIUserInterfaceIdiomPad ) {
         
            pzContentViewController *content = [[pzContentViewController alloc]initWithNibName:nil bundle:nil];
        
            self.myPopoverController = [[UIPopoverController alloc ] initWithContentViewController:content];
            
            content.myPopoverController = self.myPopoverController ;
            
            
            self.myBarButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(performAddWithPopover:)];
    
            NSLog(@"ipad");
            
            
        }else {
            
            self.myBarButtonAdd = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self action:@selector(performAddWithAlertView:)];
            NSLog(@"iphone");
    
        }

popped out view controller
---------------------------
verification of ipad

    -(BOOL)isPopover
    {
        Class popoverClass = NSClassFromString(@"UIPopoverController");
        
        if (popoverClass !=nil && UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && self.myPopoverController !=nil) {
            
            
            return  YES;
            
            
        }else {
            return NO;
            
        }
        
        
    }

other action 

    if ([self isPopover]) {
        
        [self.myPopoverController dismissPopoverAnimated:YES];
    }