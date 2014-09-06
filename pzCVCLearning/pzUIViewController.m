//
//  pzUIViewController.m
//  pzCVCLearning
//
//  Created by Cindy Zheng on 9/5/14.
//  Copyright (c) 2014 com.6pingblky. All rights reserved.
//

#import "pzUIViewController.h"
#import "pzCollectionViewCell.h"
#import "footer.h"
#import "header.h"


@interface pzUIViewController ()
@property (strong,nonatomic)NSArray * allImages;

@end

static NSString * myCollectionViewID = @"cell";
static NSString * myCollectionViewHeader = @"cellHeader";
static NSString * myCollectionViewFooter = @"cellFooter";



const NSTimeInterval kAnimationDuration = 0.20;


@implementation pzUIViewController

-(NSArray *)allImages
{
    static NSArray * AllSectionImages = nil;
    
    if (AllSectionImages ==nil) {
        AllSectionImages = @[[UIImage imageNamed:@"1"], [UIImage imageNamed:@"2"], [UIImage imageNamed: @"3"]   ];
        
    }
    return AllSectionImages;
}

-(UIImage *)randomImage
{
    
    return  self.allImages [arc4random_uniform( [self allImages].count)] ;
    
    
}

-(instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithCollectionViewLayout:layout];
    
    
    if (self != nil) {
        

        UINib *nib = [UINib nibWithNibName:NSStringFromClass( [pzCollectionViewCell class]) bundle:[NSBundle mainBundle] ];
        [self.collectionView registerNib:nib forCellWithReuseIdentifier:myCollectionViewID];
        
        UINib *headerNib = [UINib nibWithNibName:NSStringFromClass( [header class ]) bundle: [NSBundle mainBundle]];
        [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:myCollectionViewHeader];
        
         
         
         
        UINib *footerNib = [UINib nibWithNibName: NSStringFromClass([footer class]) bundle:[NSBundle mainBundle]  ];
        [self.collectionView registerNib:footerNib forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:myCollectionViewFooter];
        
        
    }
    
    return  self;
    
}

-(UICollectionReusableView *) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * reuserIdentifier = myCollectionViewHeader;
    if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        reuserIdentifier = myCollectionViewFooter ;
    }
    
 
 
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuserIdentifier forIndexPath:indexPath  ];
    
    if ([kind isEqualToString: UICollectionElementKindSectionHeader]) {
        header *hea = (header *)view;
        hea.headerLabel.text =[NSString stringWithFormat:@"section header %lu",(unsigned long)indexPath.section +1 ];
      
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        footer *foo = (footer *)view    ;
        
        NSString *title = [NSString stringWithFormat:@"section footer %lu",(unsigned long)indexPath.section +1];
        [foo.footerButton setTitle:title forState:UIControlStateNormal];
        
    }
        
    return view;
    
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

{
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
   [UIView animateWithDuration:kAnimationDuration animations:^{
       selectedCell.alpha = 0.0f;
       
   } completion:^(BOOL finished) {
       [UIView animateWithDuration:kAnimationDuration animations:^{
           selectedCell.alpha = 1.0f;
       }];
       
   }];
                       
    
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        selectedCell.transform = CGAffineTransformMakeScale(2.0f, 2.0f);  }  ];
    
    
}
- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath;

{
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    
    [UIView animateWithDuration:kAnimationDuration animations:^{
        selectedCell.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
    } ];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
 

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
{
    return 10 + arc4random_uniform(6);
    
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 3+arc4random_uniform(4);

}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
 
    pzCollectionViewCell * myCell = [collectionView dequeueReusableCellWithReuseIdentifier:myCollectionViewID forIndexPath:indexPath];
    
    myCell.imageViewBackgroundImage.image = [self randomImage];
    myCell.imageViewBackgroundImage.contentMode =  UIViewContentModeScaleAspectFit ;
    
    
    return  myCell;
    
    
}
@end
