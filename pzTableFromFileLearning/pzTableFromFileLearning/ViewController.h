//
//  ViewController.h
//  pzTableFromFileLearning
//
//  Created by Cindy Zheng on 9/3/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *myTableView;

@end
