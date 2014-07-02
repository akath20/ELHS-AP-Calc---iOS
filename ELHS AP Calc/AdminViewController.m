//
//  AdminViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "AdminViewController.h"
#import <Parse/Parse.h>

@interface AdminViewController ()

@end

@implementation AdminViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)showAlert {
    
    [[[UIAlertView alloc] initWithTitle:@"Wrong Username/Password" message:@"Check username and password." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
    
}

- (IBAction)goPressed:(id)sender {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Admins"];
    [query whereKey:@"username" equalTo:_username.text];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error||[objects count] < 1) {
            //wrong username
            [self showAlert];
        } else if (![[[objects objectAtIndex:0] objectForKey:@"password"] isEqualToString:_password.text]) {
        //password wrong
            [self showAlert];
        
        } else {
        
            if ([[[objects objectAtIndex:0] objectForKey:@"password"] isEqualToString:_password.text]) {
                [self performSegueWithIdentifier:@"adminPage" sender:nil];
            }
            
            
        }
    }];
    
    
}
@end
