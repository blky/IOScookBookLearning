table view
==============

table view controller ,  table view data source, delegate
--------------
-viewcontroller.h

    include tableviewcell property

-viewcontroller.m

    registerClass of tableviewcell
    implemented required datasource method. 
    delegate handels editing, deletion, etc. 
 
        
-dictionary methods often used 

     data source structure 
        dictionary with each element as array
     dictionary [key]: array of value
     dictionary allkeys : array of all keys
     
     NSString * sectionNameInDictionary = self.dictonaryOfNumbers.allKeys[section];
     NSArray * sectionArray = self.dictonaryOfNumbers[sectionNameInDictionary];




