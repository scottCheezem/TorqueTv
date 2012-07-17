//
//  browserView.m
//  TorqueTv
//
//  Created by Scott Cheezem on 7/16/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//



#import "browserView.h"

@interface browserView ()

@end

@implementation browserView
@synthesize showdetailsId;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    

    if(!showdetailsId){
        NSString* urlString = @"http://theroyalwe.net/~user/torqueTv/xbmcConnect.php";
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            [self performSelectorOnMainThread:@selector(fetchedShowData:) withObject:data waitUntilDone:YES];
        }) ;
    }else{
        NSString* urlString = [NSString stringWithFormat:@"http://theroyalwe.net/~user/torqueTv/xbmcConnect.php?showid=%@", showdetailsId];    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            [self performSelectorOnMainThread:@selector(fetchedEpisodes:) withObject:data waitUntilDone:YES];
        }) ;
    
    }
    
}

- (void)viewDidLoad
{
    

    [super viewDidLoad];
    shows = [[NSMutableArray alloc]init];
    //showdetailsId = [[NSString alloc]init];
    
    
    

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return shows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    if(!showdetailsId){
        static NSString *CellIdentifier = @"showCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

        // Configure the cell...
        cell.textLabel.text = [[shows objectAtIndex:indexPath.row]showTitle];
        return cell;
    }else{
        static NSString *CellIdentifier = @"epCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        cell.textLabel.text = [[shows objectAtIndex:indexPath.row]epTitle];        
        
        return cell;
        
    }
    return cell;
    
    

}

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
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if(!showdetailsId){
        browserView *eppBrowser = [segue destinationViewController];
        NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
        eppBrowser.showdetailsId = [[shows objectAtIndex:selected.row]showId];
    }
    
}



-(void)fetchedShowData:(NSData*)responseData{
    
    NSError *err;
    NSDictionary* jsonResponse = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&err];
    NSArray *showsJson = [jsonResponse objectForKey:@"shows"];
    
    for (NSDictionary *showDict in showsJson) {
        //NSLog(@"%@, %@", [showDict valueForKey:@"showId"], [showDict valueForKey:@"showTitle"]);
        
        Show *show = [[Show alloc]init];
        show.showTitle = [showDict valueForKey:@"showTitle"];
        show.showId = [showDict valueForKey:@"showId"];
        [shows addObject:show];
        
    }
    [self.tableView reloadData];
    //NSLog(@"%@", shows);
    
    
    
    
}

-(void)fetchedEpisodes:(NSData*)responseData{
    
    NSError *err;
    NSDictionary* jsonResponse = [NSJSONSerialization JSONObjectWithData:responseData options:kNilOptions error:&err];
    NSArray *episodeJson = [jsonResponse objectForKey:@"episodes"];
    
    for(NSDictionary *epDict in episodeJson){
        Episode *episode = [[Episode alloc]init];
        episode.epTitle = [epDict valueForKey:@"epTitle"];
        episode.path = [epDict valueForKey:@"path"];
        [shows addObject:episode];
    }
    [self.tableView reloadData];
    
    
}

@end
