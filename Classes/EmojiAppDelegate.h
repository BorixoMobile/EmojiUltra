//
//  EmojiconAppDelegate.h
//  Emojicon
//
//  Created by Naveen Selvadurai on 1/23/09.
//  Copyright 2009 Naveen Selvadurai
//  Copyright 2012 Borixo Mobile www.borixo.com 
//

#import <UIKit/UIKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface EmojiAppDelegate : NSObject <UIApplicationDelegate, MFMailComposeViewControllerDelegate,MFMessageComposeViewControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
    UIScrollView *helpScrollView;
    UITextView *textView;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UIScrollView *helpScrollView;
@property (nonatomic, retain) IBOutlet UITextView *textView;


-(IBAction)hideKeyboard:(id)sender;
-(IBAction)textCopy:(id)sender;
-(IBAction)textSms:(id)sender;
-(IBAction)textEmail:(id)sender;


-(IBAction)openFacebook:(id)sender;
-(IBAction)openTwiter:(id)sender;
-(IBAction)openWww:(id)sender;
-(IBAction)openEmail:(id)sender;
-(IBAction)openMore:(id)sender;
-(IBAction)openYouTube:(id)sender;




@end

