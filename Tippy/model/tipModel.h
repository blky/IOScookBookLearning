//
//  tipModel.h
//  Tippy
//
//  Created by Cindy Zheng on 7/11/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface tipModel : NSObject
@property float billAmount;
@property float tipPercent;

- (float) tipTotal;
- (float) billTotal;


@end
