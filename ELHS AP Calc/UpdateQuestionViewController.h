//
//  UpdateQuestionViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/5/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateQuestionViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *questionField;
@property (strong, nonatomic) IBOutlet UITextField *answerField;
@property (strong, nonatomic) IBOutlet UIButton *updateButton;

- (IBAction)updateButtonClicked:(id)sender;
- (IBAction)cancelButtonClicked:(id)sender;
@end
