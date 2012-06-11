//
//  RootViewController.h
//  Emojicon
//
//
//  Created by Naveen Selvadurai on 1/23/09.
//  Copyright 2009 Naveen Selvadurai
//  Copyright 2012 Borixo Mobile www.borixo.com //

#import <UIKit/UIKit.h>

@class MainViewController;

@interface RootViewController : UIViewController {

    MainViewController *mainViewController;
}

@property (nonatomic, retain) MainViewController *mainViewController;

@end
