//
//  NewsViewController.h
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *newsTextView;
@property (strong, nonatomic) IBOutlet UILabel *refreshedLabel;

- (IBAction)refreshedButtonClicked:(UIBarButtonItem *)sender;

@end
