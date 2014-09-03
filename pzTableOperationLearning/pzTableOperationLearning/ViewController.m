//
//  ViewController.m
//  pzTableOperationLearning
//
//  Created by Cindy Zheng on 8/26/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "ViewController.h"

static NSString * TableCellID = @"myCell";

@interface ViewController ()

@property (nonatomic,strong )NSMutableArray *  arrayOfSections;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *listDataSourceBarButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *groupButtonClick;

@end

@implementation ViewController

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

#pragma mark - barButton clicks


- (IBAction)groupBarButtonClicked:(UIBarButtonItem *)sender {
    
    
    
    //delete cell 1 on all section
    
    for (NSUInteger i = 0; i<[self.arrayOfSections count]; i++) {
       
        NSUInteger indexArr[] = { i , 0};
        
        NSIndexPath *myindexPath = [NSIndexPath indexPathWithIndexes:indexArr length:2];
        
        [self tableView:self.myTableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:myindexPath];
    }
    
}


- (IBAction)listDataBarButtonClick:(UIBarButtonItem *)sender {
    
    
    NSLog(@"data source is ...%@",self.arrayOfSections);
    
    
}
#pragma mark - tableview datasource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    return [self.arrayOfSections[section] count];
    
   // NSMutableArray *sectionArray = self.arrayOfSections[section];
   // return  sectionArray.count;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    UITableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier: TableCellID forIndexPath:indexPath];
    
    cell.textLabel.text = [[NSString alloc]initWithFormat:@"[%ld][%ld]", (long) indexPath.section,(long)indexPath.row];
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return  [self.arrayOfSections count];
    
    
}
    

    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
// fixed font style. use custom view (UILabel) if you want something different
{
    NSString *title = [[NSString alloc]initWithFormat:@"Header %i",section];
    
    return title;
    
    
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section;
{
   // NSString *title = [[NSString alloc]initWithFormat:@"Footer %i",section];
    
 //   return title;
    return nil;
    
    
}


-(UILabel *)newLableWithTitle:(NSString *)paramTitle
{
    
    UILabel   * Label = [[UILabel alloc]initWithFrame: CGRectZero];
    Label.text=paramTitle;
    Label.backgroundColor = [UIColor clearColor];
    [Label sizeToFit];
    return  Label;
    
    
}
#pragma mark - selecing cell

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
 
    NSLog(@"TABLE CELL CLICKED");
    NSLog(@"INDEXPATH for table and data :[%i][%i]: table display : %@ : arary value : %@",indexPath.section, indexPath.row,  [tableView cellForRowAtIndexPath:indexPath].textLabel.text,self.arrayOfSections[indexPath.section][indexPath.row]);
    
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    
    
    //UITableViewCell * ownerCell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"ACCESSARY BUTTON CLICKED");

    NSLog(@"INDEXPATH for table and data :[%i][%i]: table display : %@ : arary value : %@",indexPath.section, indexPath.row,  [tableView cellForRowAtIndexPath:indexPath].textLabel.text,self.arrayOfSections[indexPath.section][indexPath.row]);

    
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
        [self.arrayOfSections[indexPath.section] removeObjectAtIndex:indexPath.row];
        
        
        
        //remove from view
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        //if all section has been deleted.
        if ([self.arrayOfSections[indexPath.section] count] ==0) {
            
            [self.arrayOfSections removeObjectAtIndex:indexPath.section ];
            NSIndexSet *index = [[NSIndexSet alloc]initWithIndex:indexPath.section];
            [tableView deleteSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
            
            
        }
    }
}
# pragma mark - data source arraies


-(NSMutableArray *)newSectionWithIndex :(NSUInteger)paramIndex cellCount:(NSUInteger) paramCellCount
{
    NSMutableArray * result = [[NSMutableArray alloc]init];
    
    NSUInteger counter = 0;
    
    for (counter =0; counter < paramCellCount; counter++) {
        [result addObject:[[NSString alloc]initWithFormat:@"[%lu][%i]",(unsigned long) paramIndex, counter]];
   
    }
    
   // NSLog(@"%@",result);
    
    return  result;
    
}

-(NSMutableArray *)arrayOfSections
{
    NSMutableArray * section1 =[self newSectionWithIndex:0 cellCount:2];
    NSMutableArray *section2 =[self newSectionWithIndex:1 cellCount:5];
    NSMutableArray *section3 = [self newSectionWithIndex:2 cellCount:3];
    
    
    if (_arrayOfSections ==nil ) {
        _arrayOfSections = [[NSMutableArray alloc]initWithArray:@[section1,section2,section3 ]];
        
    }
    return _arrayOfSections;
    
    
}


@end
