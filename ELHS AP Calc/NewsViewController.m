//
//  NewsViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "NewsViewController.h"
#import "Reachability.h"
#import <Parse/Parse.h>

@interface NewsViewController ()

@end

@implementation NewsViewController

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
    
    
    
    
    //load content
    
    
    
    
    //check if online
    
    
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        //if internet is offline
        
        _newsTextView.text = @"OFFLINE";
        
//        [[[UIAlertView alloc] initWithTitle:@"Offline" message:@"You are offline. Please connect to the internet and try again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
        
        
        
    } else {
        
        [self loadNews];
        
        
    }
    
    
    
    
    
    
    
}

- (void)viewDidLayoutSubviews {
    
    
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"]) {
        //if not logged in
        [self performSegueWithIdentifier:@"signUp" sender:self];
    }
    
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

- (IBAction)refreshedButtonClicked:(UIButton *)sender {
    
    
    
    if ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] == NotReachable) {
        //if internet is offline
        
        
        
        [[[UIAlertView alloc] initWithTitle:@"Offline" message:@"You are offline. Please connect to the internet and try again" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil] show];
        
        
        
    } else {
        
        [self loadNews];
        
        
        
    }

    
    
    
    
    
}


- (void)loadNews {
    
    
    
    //if online, load content
    
    PFObject *news = [PFQuery getObjectOfClass:@"News" objectId:@"Bfzgc60Xir"];
    
    
    //pull out info
    NSString *title = [news objectForKey:@"title"];
    NSString *username = [news objectForKey:@"username"];
    NSDate *date = news.updatedAt;
    
    NSDateFormatter *gmtFormatter = [[NSDateFormatter alloc] init];
    [gmtFormatter setDateFormat:@"E MMM d @ hh:mm a"];
    NSString *timePosted = [gmtFormatter stringFromDate:date];
    
    
    
    NSString *post = [news objectForKey:@"post"];
    
    
    //format message to display
    
    NSString *message = [[NSString alloc] initWithFormat:@"Title: %@ \nUser: %@ \nTime: %@ \n\n%@", title, username, timePosted, post];
    
    
    //display message
    _newsTextView.text = message;
    
    //update loaded time at top
    NSDate *currentDate = [NSDate date];
    _refreshedLabel.text = [NSString stringWithFormat:@"Refreshed: %@", [gmtFormatter stringFromDate:currentDate]];
    
    
    
}
@end
