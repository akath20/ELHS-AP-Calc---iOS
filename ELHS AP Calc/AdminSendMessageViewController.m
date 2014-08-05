//
//  AdminSendMessageViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "AdminSendMessageViewController.h"
#import "Reachability.h"
#import <Parse/Parse.h>

@interface AdminSendMessageViewController ()

@end

@implementation AdminSendMessageViewController

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
    
    [self.numberLabel setText:@""];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    //load the number to send to
    [PFCloud callFunctionInBackground:@"pushcount" withParameters:@{} block:^(id object, NSError *error) {
        if (error) {
            NSLog(@"\nError in Push Count. Check cloud code for info");
            
            [self.numberLabel setText:@"N/A"];
        } else {
            
            
            [self.numberLabel setText:[NSString stringWithFormat:@"%@", object]];
        }
        
        
        
    }];
    
    
    
    
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

- (void)sendMessage {
    if (([_titleBox.text isEqual:@""]) || ([_messageBox.text isEqual:@""]) || ([_messageBox.text isEqual:@"Type Message Here"])) {
        
        //if error
        [[[UIAlertView alloc] initWithTitle:@"Invalid" message:@"Invalid entry. Fill both fields in." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
        
        
    } else {
        
        //if all good, update in cloud
        
        //check internet
        
        if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
            //if internet is offline
            
            
            [[[UIAlertView alloc] initWithTitle:@"Offline" message:@"You are offline. Please connect to the internet and try again." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
            
            
            
        } else {
            
            
            //confirm they want this
            
            UIActionSheet *confirm = [[UIActionSheet alloc] initWithTitle:@"Are you sure you want to sent this message? WARNING: This will overwrite previous message in news tab." delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Send" otherButtonTitles: nil];
            
            confirm.tag = 0;
            
            [confirm showInView:self.view];
             
            
            
        }
        
        
        
        
    }
    
}

- (IBAction)actionPressed:(UIBarButtonItem *)sender {
    
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Choose Action" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Send Message", @"Update Question", nil];
    

    actionSheet.tag = 1;
    
    [actionSheet showInView:self.view];
    



    
}





- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    if (actionSheet.tag == 0) {
        //send actionsheet
        
        
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Send"]) {
            
            //send message
            
            //if all good update
            
            PFQuery *query = [PFQuery queryWithClassName:@"News"];
            [query getObjectInBackgroundWithId:@"Bfzgc60Xir" block:^(PFObject *object, NSError *error) {
                
                if (error) {
                    
                    
                    [self errorAlert:error];
                    
                    
                } else {
                    
                    //if good update
                    object[@"title"] = _titleBox.text;
                    object[@"username"] = [[NSUserDefaults standardUserDefaults] objectForKey:@"adminUsername"];
                    object[@"post"] = _messageBox.text;
                    [object saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                        if (succeeded && !error) {
                            
                            //
                            
                            if ([_pushNotificationSwitch isOn]) {
                                //if push is on, send push
                                
                                
                                
                                //send push here
                                
                                
                                PFQuery *query = [PFInstallation query];
                                [query whereKey:@"cangetpush" equalTo:@"yes"];
                                [PFPush sendPushMessageToQueryInBackground:query withMessage:_titleBox.text block:^(BOOL succeeded, NSError *error) {
                                    if (succeeded && !error) {
                                        //if all good
                                        [[[UIAlertView alloc] initWithTitle:@"Sent" message:@"Message was successfully sent." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                                        
                                    } else {
                                        
                                        [self errorAlert:error];
                                        
                                        
                                        
                                    }
                                }];
                                
                                
                                
                            } else {
                                
                                //else, everything is good
                                
                                [[[UIAlertView alloc] initWithTitle:@"Sent" message:@"Message was successfully updated." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
                                
                            }
                            
                            
                            
                            
                            
                            
                        } else {
                            
                            //if error
                            [self errorAlert:error];
                            
                            
                        }
                    }];
                    
                }
                
            }];
            
            
            
            
        }
        
        
        //else cancel
        
        
        
    } else if (actionSheet.tag == 1) {
        //action actionsheet
        
        if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Send Message"]) {
            
            [self sendMessage];
            
        } else if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"Update Question"]) {
            
            [self performSegueWithIdentifier:@"updateQuestion" sender:nil];
            
            
        } else {
            
            NSLog(@"Error with admin update question segue");
            
        }
        
        
        
        
        
        
    } else {
        NSLog(@"ActionSheet Error, Send Message - Admin");
        
    }
    
    
    
}

- (void)errorAlert:(NSError *)error {
    
    
    [[[UIAlertView alloc] initWithTitle:@"Error" message:[NSString stringWithFormat:@"There was an error. Please try again. %@", error.localizedDescription] delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
    
    
    
    
}
    


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    [_titleBox resignFirstResponder];
    [_messageBox resignFirstResponder];
    
    
}
    
    
    
    
    





@end
