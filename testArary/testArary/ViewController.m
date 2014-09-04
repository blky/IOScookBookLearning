//
//  ViewController.m
//  testArary
//
//  Created by Cindy Zheng on 9/3/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

 
    NSArray *array1 = @[@"a1",@"b2",@"c3",@"d4",@"e5"];
    //NSString * ab = [NSString stringWithFormat:@"this is string "];
   
    NSLog(@"this array is %@", array1 );
    
    NSMutableArray * marray = [[NSMutableArray alloc]initWithArray:array1];
    
    [marray removeObjectAtIndex:1];
    NSLog(@"the mutalbed array is %@",marray);
    
    
    for (int i = 0; i < marray.count; i++) {
        NSLog(@"index is %i, value is %@",i,marray[i]);
        
    }
    
    NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche",
                             @"Opel", @"Volkswagen", @"Audi"];
    
    NSArray *sortedarray = [germanMakes sortedArrayUsingSelector:@selector(caseInsensitiveCompare:) ];
 
    NSLog(@"sorted array is :%@",sortedarray);
    
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    
    NSDictionary *car1 = @{
                           @"make": @"Volkswagen",
                           @"model": @"Golf",
                           @"price": [NSDecimalNumber decimalNumberWithString:@"18750.00"]
                           };
    NSDictionary *car2 = @{
                           @"make": @"Honda",
                           @"model": @"Eos",
                           @"price": [NSDecimalNumber decimalNumberWithString:@"35820.00"]
                           };
    NSDictionary *car3 = @{
                           @"make": @"Volkswagen",
                           @"model": @"Jetta A5",
                           @"price": [NSDecimalNumber decimalNumberWithString:@"16675.00"]
                           };
    NSDictionary *car4 = @{
                           @"make": @"Volkswagen",
                           @"model": @"Jetta A4",
                           @"price": [NSDecimalNumber decimalNumberWithString:@"16676.00"]
                           };
    NSMutableArray *cars = [NSMutableArray arrayWithObjects:
                            car1, car2, car3, car4, nil];
    
    NSSortDescriptor *priceDescriptor = [NSSortDescriptor
                                         sortDescriptorWithKey:@"price"
                                         ascending:YES
                                         selector:@selector(compare:)];
    NSSortDescriptor *modelDescriptor = [NSSortDescriptor
                                         sortDescriptorWithKey:@"model"
                                         ascending:YES
                                         selector:@selector(caseInsensitiveCompare:)];
    NSSortDescriptor *makeDescriptor = [NSSortDescriptor
                                         sortDescriptorWithKey:@"make"
                                         ascending:YES
                                         selector:@selector(caseInsensitiveCompare:)];
    
    //NSArray *descriptors = @[priceDescriptor, modelDescriptor];
    NSArray *descriptors = @[makeDescriptor,priceDescriptor,modelDescriptor];
    [cars sortUsingDescriptors:descriptors];
    NSLog(@"%@", cars);    // car4, car3, car1, car2
 
    
    
    
    NSArray *ukMakes = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
    NSLog(@"%@", [ukMakes componentsJoinedByString:@", "]);
	
}


@end
