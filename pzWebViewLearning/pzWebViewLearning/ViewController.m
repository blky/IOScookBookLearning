//
//  ViewController.m
//  pzWebViewLearning
//
//  Created by Cindy Zheng on 8/21/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (nonatomic,strong)UIWebView * myWebView;
 
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myWebView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    self.myWebView.delegate = self;
   
    self.myWebView.scalesPageToFit = YES;
    
    [self.view addSubview: self.myWebView];
    
    
   // NSString * htmlString = @"<br>IOS 7 Programming <b>Cookbook</b>";
    //[self.myWebView loadHTMLString:htmlString baseURL:nil];
    
    
    
    NSURL * myURL = [NSURL URLWithString: @"http://www.apple.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    
    [self.myWebView loadRequest:request];
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);


}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:YES];
    
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication]setNetworkActivityIndicatorVisible:NO];
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}


@end
