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
    
    
    NSString *urlString = [REMOTE_HOST stringByAppendingString:XBMC_SERVICE];
        
    NSString *postString = (showdetailsId)?[@"showid=" stringByAppendingString:showdetailsId]:nil;

    [self sendPost:urlString :postString delegate:self];        
    
    
}

- (void)viewDidLoad
{
    

    [super viewDidLoad];
    shows = [[NSMutableArray alloc]init];
    recievedData = [[NSMutableData alloc]init];
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
        //cell.detailTextLabel.text = [[shows objectAtIndex:indexPath.row]showId];
        
        return cell;
    }else{
        static NSString *CellIdentifier = @"epCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        cell.textLabel.text = [[shows objectAtIndex:indexPath.row]epTitle];        
        cell.detailTextLabel.text = [[shows objectAtIndex:indexPath.row]epCode];
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
    if(showdetailsId) {
        //send the path to streamcontrol.php
        
        UINavigationController *nc = (UINavigationController*)[self.tabBarController.viewControllers objectAtIndex:0];
        NowPlayingViewController *npvc = [nc.viewControllers objectAtIndex:0];
        
        //npvc.path = [[shows objectAtIndex:indexPath.row]path];
        
        NSString *urlString = [REMOTE_HOST stringByAppendingString:STREAM_CONTROL];
        NSString *postString = [@"act=" stringByAppendingString:[[shows objectAtIndex:indexPath.row]path]];
        [self sendPost:urlString :postString delegate:npvc];
        
        
        
        [[self tabBarController]setSelectedIndex:1];
        //set tabBar viewController to other index...
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    
    if(!showdetailsId){
        browserView *eppBrowser = [segue destinationViewController];

        NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
        eppBrowser.title = [[shows objectAtIndex:selected.row]showTitle];
        eppBrowser.showdetailsId = [[shows objectAtIndex:selected.row]showId];
    }
    
}



-(void)sendPost:(NSString*)urlString :(NSString*)postString delegate:(id)delegate{
    
    
    //NSString* urlString = [REMOTE_HOST stringByAppendingString:XBMC_SERVICE];
    
    NSURL *url = [[NSURL alloc]initWithString:urlString];
    
    NSMutableURLRequest *postRequest = [[NSMutableURLRequest alloc]initWithURL:url];
    if(postString){
        [postRequest setHTTPMethod:@"POST"];
        //NSString *postString = [[NSString alloc]initWithFormat:@"showid=%@", showdetailsId];
        [postRequest setValue:[NSString stringWithFormat:@"%d", postString.length] forHTTPHeaderField:@"Content-length"];
        [postRequest setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
        postRequest.timeoutInterval = 10;
        
    }
    
    [[NSURLConnection alloc]initWithRequest:postRequest delegate:delegate];
    

    
    
}


-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
    //NSLog(@"Data - %@", data);
    [recievedData appendData:data];
    if(showdetailsId){
        
        [self fetchedEpisodes:recievedData];
    }else{
        [self fetchedShowData:recievedData];
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
    NSLog(@"json - %@", jsonResponse);
    NSArray *episodeJson = [jsonResponse objectForKey:@"episodes"];
    
    for(NSDictionary *epDict in episodeJson){
        Episode *episode = [[Episode alloc]init];
        episode.epTitle = [epDict valueForKey:@"epTitle"];
        episode.path = [epDict valueForKey:@"path"];
        episode.epCode =[epDict valueForKey:@"epCode"];
        [shows addObject:episode];
    }
    [self.tableView reloadData];
    
    
}

@end
