//
//  RootViewController.m
//  Emojicon
//
//  Created by Naveen Selvadurai on 1/23/09.
//  Copyright 2009 Naveen Selvadurai
//  Copyright 2012 Borixo Mobile www.borixo.com 
//

#import "RootViewController.h"
#import "MainViewController.h"

@implementation RootViewController

@synthesize mainViewController;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    MainViewController *viewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
    self.mainViewController = viewController;
    [viewController release];
	
	[self.view addSubview:mainViewController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
    [mainViewController release];
    [super dealloc];
}


@end
