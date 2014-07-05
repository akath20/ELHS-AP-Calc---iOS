//
//  UpdateQuestionViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/5/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "UpdateQuestionViewController.h"
#import <Parse/Parse.h>

@interface UpdateQuestionViewController ()

@end

@implementation UpdateQuestionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self hideKeyboard];
    
}

- (void)hideKeyboard {
    [_answerField resignFirstResponder];
    [_questionField resignFirstResponder];
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



- (void)viewWillAppear:(BOOL)animated {
    
    

    [self disableAll];
    
    
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    [query getObjectInBackgroundWithId:@"fS7InbtStw" block:^(PFObject *object, NSError *error) {
        if (error) {
            //if error
            
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
            [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
            
        } else {
            //else
            
            //set question
            _questionField.text = [NSString stringWithFormat:@"%@", [object objectForKey:@"Question"]];
            
            //set the answer
            _answerField.text = [NSString stringWithFormat:@"%@", [object objectForKey:@"Answer"]];
        
            
            [self enableAll];
            
        }
    }];
    
    
}

- (void)enableAll {
    
    [_answerField setEnabled:true];
    [_questionField setEnabled:true];
    [_updateButton setEnabled:true];
    
 
    
}


- (void)disableAll {
    
    [_answerField setEnabled:false];
    [_questionField setEnabled:false];
    [_updateButton setEnabled:false];
    
    
}

- (IBAction)updateButtonClicked:(id)sender {
    
    [self hideKeyboard];
    
    
    [self disableAll];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Question"];
    [query getObjectInBackgroundWithId:@"fS7InbtStw" block:^(PFObject *object, NSError *error) {
        if (error) {
            //if error
            
            NSLog(@"Error: %@ %@", error, [error userInfo]);
            
            [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
            
        } else {
            //else
            
            //set question
            [object setObject:_questionField.text forKey:@"Question"];
            
            //set the answer
            [object setObject:_answerField.text forKey:@"Answer"];
            
            
            [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (succeeded && !error) {
                    
                    [self enableAll];
                    
                    [[[UIAlertView alloc] initWithTitle:@"Success" message:@"Question successfully updated." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                    
                    [self cancelButtonClicked:nil];
                    
                    
                } else {
                    
                    [[[UIAlertView alloc] initWithTitle:@"Error" message:error.localizedDescription delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                    
                }
            }];
            
            
            
        }
    }];
    
    
    
    
    
    
    
}

- (IBAction)cancelButtonClicked:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



























@end




