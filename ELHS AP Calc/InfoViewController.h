//
//  InfoViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *firstnameText;
@property (strong, nonatomic) IBOutlet UITextField *lastnameText;

- (IBAction)goPressed:(id)sender;
@end
