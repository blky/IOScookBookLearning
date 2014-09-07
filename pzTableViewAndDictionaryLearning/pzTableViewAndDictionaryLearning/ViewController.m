//
//  ViewController.m
//  pzTableViewAndDictionaryLearning
//
//  Created by Cindy Zheng on 9/4/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//
static NSString * TableCellID = @"myCell";
static NSString * fieldOdd = @"Odd Numbers";
static NSString *fieldEven = @"Even Numbers";

#import "ViewController.h"

@interface ViewController ()



@property (nonatomic, strong)NSMutableDictionary * dictonaryOfNumbers;

//@property (weak, nonatomic) IBOutlet UIBarButtonItem  *barButtonAction;


@end

@implementation ViewController


- (IBAction)groupBarbuttonClick:(UIBarButtonItem *)sender {
    
    //delete all value great than 2
    
    NSMutableArray *arrayofIndexPathsToDelete = [[NSMutableArray alloc]init];
    NSMutableArray *arrayofNumberObjectsToDelete = [[NSMutableArray alloc]init];
    
    //gather objects we have to delete in data source
    __block NSUInteger keyIndex = 0;
    
    [self.dictonaryOfNumbers enumerateKeysAndObjectsUsingBlock:^(NSString * key, NSMutableArray *obj, BOOL *stop) {
        
        [obj enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger idx, BOOL *stop) {
            if ([number unsignedIntegerValue] >3) {
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:keyIndex];
                
                [arrayofIndexPathsToDelete addObject:indexPath];
                [arrayofNumberObjectsToDelete addObject:number];
                
            }
        }];
        keyIndex ++;
        
    }];
    
    if ([arrayofNumberObjectsToDelete count] > 0) {
        
        
        NSMutableArray * arrayOfOddNumbers = self.dictonaryOfNumbers [fieldOdd];
        NSMutableArray *arrayofEvenNumbers = self.dictonaryOfNumbers [fieldEven];
        
        [arrayofNumberObjectsToDelete enumerateObjectsUsingBlock:^(NSNumber *number , NSUInteger idx, BOOL *stop) {
            if ([arrayOfOddNumbers indexOfObject:number]!= NSNotFound) {
                [arrayOfOddNumbers removeObject:number];
                
            }
            if ([arrayofEvenNumbers indexOfObject:number] != NSNotFound) {
                [arrayofEvenNumbers removeObject:number];
                
            }
            
        }];
    }
    
    
    [self.myTableView deleteRowsAtIndexPaths:arrayofIndexPathsToDelete withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

    NSLog(@"my data source is %@",self.dictonaryOfNumbers);
    
    
}


- (IBAction)barButtonAction:(UIBarButtonItem *)sender {
    NSString *key = fieldOdd;
    NSInteger indexForKey = [[self.dictonaryOfNumbers allKeys ] indexOfObject:key ]   ;
    
    if (indexForKey ==NSNotFound) {
        
        NSLog(@"could not find hte section in the data source");
        return;
        
    }
    //data source

    [self deleteWholeDataSection:key];
   
    //tableview
    NSIndexSet *sectionToDelete = [NSIndexSet indexSetWithIndex:indexForKey];
    [self deleteWholeTableSection:sectionToDelete];
    
}

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


#pragma mark - group operation on tableview cells
/*
 
 - (IBAction)groupBarButtonClicked:(UIBarButtonItem *)sender {
 
 
 
 //delete cell 1 on all section
 
 for (NSUInteger i = 0; i<[self.arrayOfDataSource count]; i++) {
 
 NSUInteger indexArr[] = { i , 0};
 
 NSIndexPath *myindexPath = [NSIndexPath indexPathWithIndexes:indexArr length:2];
 
 [self tableView:self.myTableView commitEditingStyle:UITableViewCellEditingStyleDelete forRowAtIndexPath:myindexPath];
 }
 
 }
 */



#pragma mark - tableview datasource protocol

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

{
    NSString * sectionNameInDictionary = self.dictonaryOfNumbers.allKeys[section];
    NSArray * sectionArray = self.dictonaryOfNumbers[sectionNameInDictionary];
    return  sectionArray.count  ;
    
 
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

{
    UITableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier: TableCellID forIndexPath:indexPath];
    
   
    NSString * sectionNameInDictionary = self.dictonaryOfNumbers.allKeys[indexPath.section];
    NSArray * sectionArray = self.dictonaryOfNumbers[sectionNameInDictionary];
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)[sectionArray [indexPath.row] unsignedIntegerValue]];
    
    
    
     cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    
    return  [self.dictonaryOfNumbers.allKeys count];
    
    
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
// fixed font style. use custom view (UILabel) if you want something different
{
    
    return self.dictonaryOfNumbers.allKeys [section] ;
    
    
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
    
    NSString * sectionNameInDictionary = self.dictonaryOfNumbers.allKeys[indexPath.section];
    NSArray * sectionArray = self.dictonaryOfNumbers[sectionNameInDictionary];
    
    
    NSLog(@"table view cell selected [ %i %i ] with content %@",indexPath.section, indexPath.row,  sectionArray [indexPath.row]  );
    
    
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSString * sectionNameInDictionary = self.dictonaryOfNumbers.allKeys[indexPath.section];
    NSArray * sectionArray = self.dictonaryOfNumbers[sectionNameInDictionary];
    
    NSLog(@"accessary icon  selected [ %i %i ] with content %@",indexPath.section, indexPath.row,  sectionArray [indexPath.row]  );
    
    
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
    NSString * sectionNameInDictionary = self.dictonaryOfNumbers.allKeys[indexPath.section];
  
     if (editingStyle == UITableViewCellEditingStyleDelete)
     {
         //remove one item from data source
        [self.dictonaryOfNumbers [sectionNameInDictionary] removeObjectAtIndex:indexPath.row    ];
        
       /*
        //remove whole section handling
        if ([self.dictonaryOfNumbers[sectionNameInDictionary] count ] == 0)
        {
            
            //remove whole array from data source dictionary
            [self deleteWholeDataSection:sectionNameInDictionary];
            
            //remove whole section from tableview
            NSIndexSet *index = [[NSIndexSet alloc]initWithIndex:indexPath.section];
            
            [self deleteWholeTableSection:index];
            
        }else //remove one cell from tableview
        {
            
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];


        }
        */
         [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

     }
    
}
                                                                                                                  
                                                                                                                  
# pragma mark - data source arraies
-(NSMutableDictionary *) dictonaryOfNumbers
{
 
    if (_dictonaryOfNumbers ==nil) {
        
        NSMutableArray *arrayofEvenNumber = [[NSMutableArray alloc]initWithArray:@[@0,@2,@4,@6]];
        NSMutableArray *arrayofOddNumber = [[NSMutableArray alloc]initWithArray:@[@1,@3,@5,@7]];

        _dictonaryOfNumbers =[[NSMutableDictionary alloc]initWithDictionary:@{fieldEven: arrayofEvenNumber,
                                                                              fieldOdd: arrayofOddNumber }];
        
    }
    
    return  _dictonaryOfNumbers;
    
}

-(void)deleteWholeDataSection:(NSString *)key
{
    [self.dictonaryOfNumbers removeObjectForKey:key];

}

-(void)deleteWholeTableSection:(NSIndexSet *)indexSet
{
  
    NSLog( @"%@",indexSet);
    
    [self.myTableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    NSLog(@"<%@:%@:%d>", NSStringFromClass([self class]), NSStringFromSelector(_cmd), __LINE__);

}


@end


