//
//  SettingsTableViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsTableViewController : UITableViewController <UITableViewDelegate, UIActionSheetDelegate>


@property (strong, nonatomic) IBOutlet UIButton *logoutUser;

- (IBAction)signout:(id)sender;

@end
