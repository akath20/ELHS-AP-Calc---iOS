//
//  VerifyViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VerifyViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *questionLabel;
@property (strong, nonatomic) IBOutlet UITextField *userAnswer;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *nextButton;

- (IBAction)nextButton:(id)sender;
- (IBAction)valueChanged:(UITextField *)sender;
@end
