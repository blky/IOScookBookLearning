web View
==============

init , configuration,etc
--------------

- .h file
-
	 @property (nonatomic,strong)UIWebView * myWebView;


 

- viewcontroller.m viewdidload method
- 
 
    self.myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
 	self.myWebView.delegate = self;
    self.myWebView.scalesPageToFit = YES;
    
	NSURL * myURL = [NSURL URLWithString: @"http://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    
    [self.myWebView loadRequest:request];