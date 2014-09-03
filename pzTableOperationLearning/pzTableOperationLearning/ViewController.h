//
//  ViewController.h
//  pzTableOperationLearning
//
//  Created by Cindy Zheng on 8/26/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *myTableView;

@end
