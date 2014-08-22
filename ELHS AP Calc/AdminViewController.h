//
//  AdminViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdminViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UILabel *versionLabel;
@property (strong, nonatomic) IBOutlet UIButton *goButton;

- (IBAction)goPressed:(id)sender;
- (IBAction)cancelPressed:(id)sender;


@end
