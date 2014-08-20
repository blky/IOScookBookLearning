//
//  pzStringReverseActivity.m
//  pzAcitivityControllerLearning
//
//  Created by Cindy Zheng on 8/19/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "pzStringReverseActivity.h"

@interface pzStringReverseActivity () <UIAlertViewDelegate>

@property (nonatomic , strong) NSArray * acitivityItems;

@end

@implementation pzStringReverseActivity

/* The UIActivity class is an abstract class that you subclass in order to implement application-specific services. A service takes data that is passed to it, does something to that data, and returns the results. For example, an social media service might take whatever text, images, or other content is provided to it and post them to the user’s account. Activity objects are used in conjunction with a UIActivityViewController object, which is responsible for presenting services to the user.
 */



-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    [self activityDidFinish:YES];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    
}

//override uiactivity abstract instant method

-(NSString *) activityType

{
   // NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    NSLog(@"this activity type is %@",[[NSBundle mainBundle].bundleIdentifier stringByAppendingFormat:@".%@",NSStringFromClass([self class])]);
    
    return [[NSBundle mainBundle].bundleIdentifier stringByAppendingFormat:@".%@",NSStringFromClass([self class])];
    
}

//override
-(NSString*)activityTitle
{
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    return @"Reverse String";
    
}

-(UIImage *)activityImage
{
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    return  [UIImage imageNamed:@"Reverse"];
    
}

-(BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    for (id object in activityItems) {
        if ([object isKindOfClass:[NSString class]]) {
            
            return  YES;
            
        }
    }
    return  NO;
    
}

-(void)prepareWithActivityItems:(NSArray *)activityItems
{
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    NSMutableArray *stringObjects = [[NSMutableArray alloc]init];
    for (id  object in activityItems) {
        if ([object isKindOfClass: [NSString class]]) {
            [stringObjects addObject:object];
            
        }
    }
    
    self.acitivityItems = [stringObjects copy];
  //  NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);
  //  NSLog(@"activity items is %@",self.acitivityItems);
    
}

-(NSString *)reverseOfString:(NSString * )paramString
{
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    NSMutableString * reversed = [[NSMutableString alloc]initWithCapacity:paramString.length];
    
    for (NSInteger counter =paramString.length-1; counter >=0;counter--)   {
        
        [reversed appendFormat:@"%c",[paramString characterAtIndex:counter]];
        
    }
    return  reversed;
    
    
}

-(void)performActivity
{

    NSMutableString * reversedStrings = [[NSMutableString alloc]init];
    
      NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    for (NSString *string in self.acitivityItems) {
        [reversedStrings appendString:[self reverseOfString:string] ] ;
        [reversedStrings appendString:@"\n"];
     
        
    }
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:@"reversed" message:reversedStrings delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    
    [alertView show];
    
}

@end
