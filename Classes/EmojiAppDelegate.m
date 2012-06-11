//
//  EmojiconAppDelegate.m
//  Emojicon
//
//  Created by Naveen Selvadurai on 1/23/09.
//  Copyright 2009 Naveen Selvadurai
//  Copyright 2012 Borixo Mobile www.borixo.com 
//

#import "EmojiAppDelegate.h"
#import "RootViewController.h"
#import <QuartzCore/QuartzCore.h>



@implementation EmojiAppDelegate


@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:[[NSHomeDirectory() stringByAppendingPathComponent:@"../../Library/Preferences/"] stringByAppendingPathComponent:@"com.apple.Preferences.plist"]];
    NSString *status = [dict objectForKey:@"KeyboardEmojiEverywhere"];
	if ([status boolValue]) {
        [tabBarController setSelectedIndex:1];
    }
    [dict release];
    
    helpScrollView.contentSize = CGSizeMake(320, 1150);
    
    // texxtview border
    textView.layer.borderWidth = 5.0f;
    textView.layer.borderColor = [[UIColor grayColor] CGColor];
    textView.layer.cornerRadius = 8;
    
    [window addSubview:[tabBarController view]];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}

-(void)hideKeyboard:(id)sender {
    [textView resignFirstResponder];
}

-(void)textCopy:(id)sender {
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = textView.text;
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Copy" message:@"Text copied" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    [textView resignFirstResponder];
}

-(void)textEmail:(id)sender {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@""];
    [controller setMessageBody:textView.text isHTML:NO]; 
    [tabBarController presentModalViewController:controller animated:YES];
    [controller release];
     [textView resignFirstResponder];
}

-(void)textSms:(id)sender {
    MFMessageComposeViewController *picker = [[MFMessageComposeViewController alloc] init];
    picker.messageComposeDelegate = self;

    picker.body = textView.text;
    
    [tabBarController presentModalViewController:picker animated:YES];
    [picker release];
    
    [textView resignFirstResponder];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller  
          didFinishWithResult:(MFMailComposeResult)result 
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [tabBarController dismissModalViewControllerAnimated:YES];
}

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    [tabBarController dismissModalViewControllerAnimated:YES];
}

-(void)openWww:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.borixo.com/"]];
}

-(void)openMore:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.com/apps/borixo"]];
}

-(void)openTwiter:(id)sender {
 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://twitter.com/BorixoMobile"]];   
}

-(void)openFacebook:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://facebook.com/BorixoMobile"]];
}

-(void)openEmail:(id)sender {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setToRecipients:[NSArray arrayWithObjects:@"support@borixo.com", nil]];
    [controller setSubject:@"Feedback about Emoji app"];
    [tabBarController presentModalViewController:controller animated:YES];
    [controller release];
    [textView resignFirstResponder];
}

-(void)openYouTube:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://youtube.com/BorixoMobile"]];
}




@end
