//
//  UsernameViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UsernameViewController : UIViewController
- (IBAction)goPushed:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (strong, nonatomic) IBOutlet UILabel *statusText;

@end
