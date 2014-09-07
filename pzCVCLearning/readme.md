collection view 
==============

collection view controller , cell, header, footer, 
--------------
- appDelegate.m

    initializing collectionviewcontroller
    setup as rootviewcontroller
    create layout for collectionviewcontroler

- viewcontroller

    include cell
    register cell's nib
     [self.collectionView registerNib:nib forCellWithReuseIdentifier:myCollectionViewID];
    
- header and footer 

    create empty xib ui clas
    connect .h and .m with xib file
    dont' forget to register the nib in viewcontroller file	
    [self.collectionView registerNib:headerNib forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:myCollectionViewHeader];
    
- random

    10 + arc4random_uniform(6)
    random image of from array of images: [arc4random_uniform( [self allImages].count)]