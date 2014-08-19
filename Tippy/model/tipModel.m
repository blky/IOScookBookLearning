//
//  tipModel.m
//  Tippy
//
//  Created by Cindy Zheng on 7/11/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "tipModel.h"

@implementation tipModel

-(float )tipTotal
{
    return self.tipPercent * self.billAmount;
    
}

-(float)billTotal
{
    return  self.billAmount + self.tipTotal;
    
}

@end
