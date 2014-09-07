Progressive View
==============

init , configuration,etc
--------------

- init
- 
        self.myProgressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];


- viewcontroller.m viewdidload method
- 
	 [super viewDidLoad];
 
    self.myProgressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleBar];
    self.myProgressView.center = self.view.center;
    
    self.myProgressView.tintColor=[UIColor redColor];
    self.myProgressView.trackTintColor = [UIColor greenColor];
    //self.myProgressView.tintColorDidChange = [UIColor greenColor];
    self.myProgressView.progress = 20/30.0f;
    
    [self.view addSubview: self.myProgressView];
 

