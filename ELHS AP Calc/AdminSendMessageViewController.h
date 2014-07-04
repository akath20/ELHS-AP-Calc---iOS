//
//  AdminSendMessageViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminSendMessageViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIBarButtonItem *sendButton;
@property (strong, nonatomic) IBOutlet UITextField *titleBox;
@property (strong, nonatomic) IBOutlet UITextView *messageBox;
@property (strong, nonatomic) IBOutlet UISwitch *pushNotificationSwitch;

- (IBAction)sendPressed:(UIBarButtonItem *)sender;

@end
