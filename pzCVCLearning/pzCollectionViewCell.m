//
//  pzCollectionViewCell.m
//  pzCVCLearning
//
//  Created by Cindy Zheng on 9/5/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "pzCollectionViewCell.h"


@interface pzCollectionViewCell()


@end

@implementation pzCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(void)awakeFromNib
{
    [super awakeFromNib];
    self.imageViewBackgroundImage.backgroundColor = [UIColor clearColor];
    self.selectedBackgroundView =[[UIView alloc]initWithFrame:self.bounds];
    self.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
    
}

@end
