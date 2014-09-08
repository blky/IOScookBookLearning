customize segue 
==============================
- create subclass UIStoryboardSegue
- set segue identifier via interface buider the same name as the Class

segue class
--------------------
implement perform method
    
       -(void)perform
    {
        UIViewController *source = self.sourceViewController;
        UIViewController *destination = self.destinationViewController;
        
        [UIView  transitionFromView:source.view
                              toView:destination.view
                            duration:1.05f
                             options:UIViewAnimationOptionTransitionFlipFromTop
                          completion:^(BOOL finished) {
                              NSLog(@"Transitioning is finished"); }];
 
    }
 