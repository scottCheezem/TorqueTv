//
//  NowPlayingViewController.m
//  TorqueTv
//
//  Created by Scott Cheezem on 7/17/12.
//  Copyright (c) 2012 theroyalwe.net. All rights reserved.
//

#import "NowPlayingViewController.h"

@interface NowPlayingViewController ()

@end

@implementation NowPlayingViewController
@synthesize webvideo;
@synthesize stopButton, path;

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

- (void)viewDidUnload
{
    [self setStopButton:nil];
    [self setWebvideo:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    NSURL *videoUrl = [[NSURL alloc]initWithString:[REMOTE_HOST stringByAppendingString:VIDEO_STREAM_URL]];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:videoUrl];
    [webvideo loadRequest:requestObj];
    
    
    
    //can't get this to work...
    /*
    MPMoviePlayerViewController *player = [[MPMoviePlayerViewController alloc]initWithContentURL:videoUrl];
    
    [player.view setFrame:CGRectMake(0, 0, 320, 270)];
    [self.view addSubview:player.view];
    player.moviePlayer.movieSourceType = MPMovieSourceTypeStreaming;
    player.moviePlayer.controlStyle = MPMovieControlStyleDefault;
    
    
    if(player){
        [player.moviePlayer prepareToPlay];
        [player.moviePlayer play];
    }*/
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return YES;
}


-(void)stopStream{
    
    //send post to stop stream
    //UINavigationController *nc = (UINavigationController*)[self.tabBarController.viewControllers objectAtIndex:0];
    browserView *browser = [[browserView alloc]init];//[nc.viewControllers objectAtIndex:1];
    NSString *host = ([[AppDefaults appDefaults]remote])?REMOTE_HOST:LOCAL_HOST;
    [browser sendPost:[host stringByAppendingString:STREAM_CONTROL] :@"act=stop" delegate:self];
    
    
    
}


-(void)connection:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse *)response{
    NSLog(@"npvc - recieved Response %@", response);
}

-(void)connection:(NSURLConnection*)connection didReceiveData:(NSData *)data{
    
    NSLog(@"npvc - recieved data %@", data);    

    
}

- (IBAction)stopAction:(id)sender {
    [self stopStream];
}
@end
