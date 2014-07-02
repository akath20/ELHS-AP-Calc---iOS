//
//  SettingsTableViewController.m
//  ELHS AP Calc
//
//  Created by Alex Atwater on 7/1/14.
//  Copyright (c) 2014 Alex Atwater. All rights reserved.
//

#import "SettingsTableViewController.h"
#import <Parse/Parse.h>

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    _logoutUser.titleLabel.text = [NSString stringWithFormat:@"    Signout %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"]];
    
}





/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signout:(id)sender {
    
    
    UIActionSheet *warning = [[UIActionSheet alloc] init];
    [[warning initWithTitle:@"Warning" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"I'm sure" otherButtonTitles: nil] showFromTabBar:self.tabBarController.tabBar];
    
    
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if ([[actionSheet buttonTitleAtIndex:buttonIndex] isEqualToString:@"I'm Sure"]) {
        //delete account and move to log in
        
        //find username to delete
        PFQuery *query = [PFQuery queryWithClassName:@"Users"];
        [query whereKey:@"username" equalTo:[[NSUserDefaults standardUserDefaults] objectForKey:@"currentUser"]];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
           
            
            if ([objects count] == 1 && !error) {
                //all set, now delete
                
                [[objects objectAtIndex:0] deleteInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    //if deleted
                    
                    if (succeeded && !error) {
                        
                        [self performSegueWithIdentifier:@"showStart" sender:self];
                        
                    }
                    
                }]
                
            }
            
            
            
        }];
        
        
        
        
    }
}











@end
