//
//  NewsViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/2/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "NewsViewController.h"

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
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
    
    NSLog(@"\nCurrent User: %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"]);
    
    id currentUser = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"];
    
    
    
    //check if user logged in
    if (currentUser == nil) {
        //if not logged in
        [self performSegueWithIdentifier:@"signUp" sender:self];
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

@end
