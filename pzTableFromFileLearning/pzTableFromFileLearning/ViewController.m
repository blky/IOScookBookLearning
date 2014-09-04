//
//  ViewController.m
//  pzTableFromFileLearning
//
//  Created by Cindy Zheng on 9/3/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"
static NSString * TableCellID = @"myCell";

@interface ViewController ()

@property (strong,nonatomic)NSString *  filename;
@property (nonatomic,strong )NSMutableArray *  arrayOfSections;


@end

@implementation ViewController


#pragma mark - selecing cell

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    NSLog(@"TABLE CELL CLICKED");
    NSLog(@"INDEXPATH for table and data :[%i][%i]: table display : %@ : arary value : %@",indexPath.section, indexPath.row,  [tableView cellForRowAtIndexPath:indexPath].textLabel.text,self.arrayOfSections[indexPath.row]);
    
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    
    //UITableViewCell * ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"ACCESSARY BUTTON CLICKED");
    
    NSLog(@"INDEXPATH for table and data :[%i][%i]: table display : %@ : arary value : %@",indexPath.section, indexPath.row,  [tableView cellForRowAtIndexPath:indexPath].textLabel.text,self.arrayOfSections [indexPath.row]);
    
    
}

#pragma  mark - delete cell



-(UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
    
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.myTableView setEditing:editing animated:animated ];
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //remove from data source
        [self.arrayOfSections  removeObjectAtIndex:indexPath.row];
         //remove from view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
       
    }
}

#pragma  mark - UI

- (void)viewDidLoad
{
    [super viewDidLoad];
     CGRect tableViewFrame =CGRectMake(self.view.bounds.origin.x , self.view.bounds.origin.y+60.0f, self.view.bounds.size.width, self.view.bounds.size.height -60.0f);
    self.myTableView = [[UITableView alloc]initWithFrame:tableViewFrame style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:TableCellID] ;
    
    self.myTableView.dataSource = self;
    
    self.myTableView.delegate =self;
    
    
    self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.myTableView];

    
}
#pragma mark - table view controller protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{

    return [self.arrayOfSections count];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier: TableCellID forIndexPath:indexPath];
    


    cell.textLabel.text =  self.arrayOfSections[indexPath.row];
    
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{

    return  1;
    
    
}

#pragma  mark - data source 

-(NSMutableArray *)arrayOfSections
{
    
    
    if (_arrayOfSections ==nil )
    {
        _arrayOfSections = [[NSMutableArray alloc]init];
        NSLog(@"========================");
        self.filename= [[NSBundle mainBundle] pathForResource:@"pz" ofType:@"plist"];
            
        //NSLog(@"new file name is %@",_filename);
       
       // NSMutableDictionary *allresult = [NSMutableDictionary dictionaryWithContentsOfFile:self.filename];
        
        NSMutableArray *allresult =[NSMutableArray arrayWithContentsOfFile:self.filename];
    
        for ( NSDictionary * item in allresult) {
          
            NSString * value = [NSString stringWithFormat:@"%@,%@",item[@"name"], item [@"radius"]];;
            NSLog(@"value is %@",value);
            
            [_arrayOfSections addObject:value ]  ;
            
           
        }
    }
    
    
    return _arrayOfSections;
    
    
}

@end
