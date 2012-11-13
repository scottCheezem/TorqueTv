//
//  SettingsViewController.m
//  TorqueTv
//
//  Created by Scott Cheezem on 7/20/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize remoteToggle;
@synthesize qualitySeg;


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
    qualityOptions = [NSArray arrayWithObjects:@"64", @"128", @"256", @"512", @"1024", nil];
    
    self.remoteToggle.on = [[AppDefaults appDefaults]remote];
    self.qualitySeg.selectedSegmentIndex = [qualityOptions indexOfObject:[[AppDefaults appDefaults]br]];
    
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    
    [self setRemoteToggle:nil];
    [self setQualitySeg:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;//(interfaceOrientation == UIInterfaceOrientationPortrait);
}




- (IBAction)remotetoggleAction:(id)sender {
    
    NSLog(@"remote was %d", [[AppDefaults appDefaults]remote]);
    NSLog(@"setting remote to %d", self.remoteToggle.on );
    [[AppDefaults appDefaults]setRemote:self.remoteToggle.on];
    

    NSLog(@"remote is now %d", [[AppDefaults appDefaults]remote]);
    
}

- (IBAction)qualitySegAction:(id)sender {
    
    
    
    
    [[AppDefaults appDefaults]setBr:[qualityOptions objectAtIndex:qualitySeg.selectedSegmentIndex]];
    NSLog(@"setting quality : %@", [qualityOptions objectAtIndex:qualitySeg.selectedSegmentIndex]);
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:[qualityOptions objectAtIndex:qualitySeg.selectedSegmentIndex] forKey:@"br"];

        
}
@end
