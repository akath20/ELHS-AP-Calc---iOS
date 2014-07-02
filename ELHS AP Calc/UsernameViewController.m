//
//  UsernameViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "UsernameViewController.h"
#import <Parse/Parse.h>

@interface UsernameViewController ()

@end

@implementation UsernameViewController

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

- (void)viewDidAppear:(BOOL)animated {
    
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [_statusText setHidden:true];
    
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

- (IBAction)goPushed:(id)sender {
    
    
    
    if (![_usernameField.text isEqual:@""]) {
        
        PFQuery *query = [PFQuery queryWithClassName:@"Users"];
        [query whereKey:@"username" equalTo:_usernameField.text];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if ([objects count] > 0 && !error) {
                //if it found it
                _statusText.text = @"Logged In";
                [_statusText setHidden:false];
                
                [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextScreen) userInfo:nil repeats:false];
                
            } else {
                
                
                //if didn't find it
                PFObject *newUsername = [PFObject objectWithClassName:@"Users"];
                newUsername[@"username"] = _usernameField.text;
                [newUsername saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    if (succeeded) {
                        _statusText.text = @"Signed Up";
                        [_statusText setHidden:false];
                      
                        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextScreen) userInfo:nil repeats:false];
                        
                    } else {
                        //if error
                        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error in saving your username. Please try again later" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                        
                    }
                }];
                
            }
            
            
            //once user is in system, make it on device
            [[NSUserDefaults standardUserDefaults] setObject:_usernameField.text forKey:@"currentUser"];
            
        }];
        
        
    }
    
    
    
    
}





- (void)nextScreen {
    
    [self performSegueWithIdentifier:@"signedUp" sender:self];
    
    
}


@end
