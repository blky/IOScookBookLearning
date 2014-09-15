Navigation Controller 
==============

navigate forward
--------------
* segue with identifier
* each view controller include a property to have value transfered from previous view controller
* create segue on barbutton 

        -(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
        {
            if ([segue.identifier isEqualToString:@"1to2"]) {
                
                if ([segue.destinationViewController isKindOfClass:[secondViewController class]]) {
                        secondViewController * sVC = (secondViewController *) segue.destinationViewController;
                        sVC.mytext = self.textField.text;
                        sVC.title = @"second";
                
                }
            }
         }


backwards:
--------------
* if need to transfer back the information, create barbutton action* 

        - (IBAction)backBarButton:(UIBarButtonItem *)sender {
    
                    // [self.navigationController popToRootViewControllerAnimated:YES];
                    int currentVCIndex = [self.navigationController.viewControllers indexOfObject:self.navigationController.topViewController];
                    
                    if ([[self.navigationController.viewControllers objectAtIndex:currentVCIndex-1 ] isKindOfClass: [thirdViewController class] ]) {
                        thirdViewController *parent = [self.navigationController.viewControllers objectAtIndex:currentVCIndex-1];
                        [self.navigationController popToViewController:parent animated:YES];
                        parent.mytext = self.textbox.text;
                    }
                  
                }
        
    
    
