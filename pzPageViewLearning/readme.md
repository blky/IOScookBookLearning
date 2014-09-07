Page View and date view
==============

------------------------------


create project with pageview project in xcode 
--------------
------------------------------

after creation of the project, there will be three classes
---------------
    1)rootviewcontroller
    2)dataviewcontroller
    3)modelcontroller
 	
the page view data source : 
------------------------------
    model controller -abstract class of some protocol with detailed  implement data source model 
	
	@interface ModelController : NSObject <UIPageViewControllerDataSource>

	- (DataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
	- (NSUInteger)indexOfViewController:(DataViewController *)viewController;
	- using data source array - this should be overwrite for real data source
	@property (readonly, strong, nonatomic) NSArray *pageData;
		in the example:
		- (id)init
	{
  	  self = [super init];
  	  if (self) {
     	   // Create the data model.
    	    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     	   _pageData = [[dateFormatter monthSymbols] copy];
   	 }
   	 return self;
	}
 
 
the page view layout 
------------------------------
    dataviewcontroller
    @property (strong, nonatomic) IBOutlet UILabel *dataLabel;
	@property (strong, nonatomic) id dataObject;


combine layout and data source with rootviewcontroller
------------------------------

	UIPageViewControllerDelegate 
	@property (strong, nonatomic) UIPageViewController *pageViewController;
	@property (readonly, strong, nonatomic) ModelController *modelController;

	  
  