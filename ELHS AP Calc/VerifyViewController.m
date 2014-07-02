//
//  VerifyViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "VerifyViewController.h"
#import "Reachability.h"
#import <Parse/Parse.h>

@interface VerifyViewController ()

@end

@implementation VerifyViewController {
    
    NSString *questionAnswer;
    
}

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

- (void)viewWillAppear:(BOOL)animated {
   
    //clear past answer
    questionAnswer = @"";
    _userAnswer.text = @"";
    _userAnswer.placeholder = @"Answer";
    [_userAnswer setEnabled:false];
    [_nextButton setEnabled:false];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    
    

    
    _questionLabel.text = @"Loading...";
    
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        //if internet is offline
        
        _questionLabel.text = @"OFFLINE";
        
        [[[UIAlertView alloc] initWithTitle:@"Offline" message:@"You are offline. Please connect to the internet and try again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
        
        
        
    } else {
        
        //if online
        //retrieve the question
        
        
        PFQuery *query = [PFQuery queryWithClassName:@"Question"];
        [query getObjectInBackgroundWithId:@"fS7InbtStw" block:^(PFObject *object, NSError *error) {
            if (error) {
                //if error
                
                NSLog(@"Error: %@ %@", error, [error userInfo]);
                
            } else {
                //else
                
                //set question
                _questionLabel.text = [NSString stringWithFormat:@"%@", [object objectForKey:@"Question"]];
                
                //enable answer
                [_userAnswer setEnabled:true];
                
                
                //set the right answer
                questionAnswer = [[NSString stringWithFormat:@"%@", [object objectForKey:@"Answer"]] lowercaseString];
                
                
            }
        }];
        
    }
    
         
    
         
    
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

- (IBAction)nextButton:(id)sender {
    
    //verify answer
    
    if ([[_userAnswer.text lowercaseString] isEqualToString:questionAnswer]) {
        //if matches from database, go on
        [self performSegueWithIdentifier:@"verified" sender:nil];
        
    } else {
        [[[UIAlertView alloc] initWithTitle:@"Incorrect" message:@"Incorrect answer. Please try again. If problem continues, please contact Alex or G. (Answer is not case-sensitive). Also make sure there is no extra space at end of answer." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
    }
    
    
    
}

- (IBAction)valueChanged:(UITextField *)sender {
    
    
    if (![sender.text isEqualToString:@""]) {
        //if not empty, enable next button
        [_nextButton setEnabled:true];
    }
    
    
    
    
    
}
@end


